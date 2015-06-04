require 'helpers/standard_deviation'

# Tasks as internal or external scripts
class Task < ActiveRecord::Base
  has_many :instances
  mount_uploader :script, ScriptUploader

  # Ensure the task is queued
  after_save :update_scheduled_task
  after_destroy :unschedule_task

  validates :name, presence: true
  validates :external, inclusion: { in: [true, false] }

  # Internal scripts need a file and an interval/scalar
  with_options if: :internal do
    validate :script_validation
    validates :scalar, presence: true
    validates :scalar, inclusion: { in: %w(days hours minutes seconds) }
    validates_format_of :interval, with: /\d+/
  end

  # External scripts need an IP
  with_options(if: :external) do
    validates :ip, presence: true, format: /\b(?:\d{1,3}\.){3}\d{1,3}\b/
  end

  # Reverse alias
  def internal
    !external
  end

  def run_every
    interval.send(scalar.to_sym)
  end

  def runtime
    last_10 = instances.last(10).map(&:duration).compact
    return last_10 if last_10.empty?
    [last_10.mean.ceil.human_time, last_10.standard_deviation]
  end

  def external_log(params)
    (instances.last || instances.create).logs.new(params)
  end

  private

    def update_scheduled_task
      return unless internal && (enabled_changed? || script_changed?)
      return unschedule_task unless enabled
      Recurring::Script.schedule(schedule_opts)
    end

    def unschedule_task
      Recurring::Script.unschedule(schedule_opts)
    end

    def schedule_opts
      { task: self, run_every: run_every, script: script.path, queue: "#{name.parameterize}_#{id}" }
    end

    def script_validation
      return if !script_changed? || command_line_validation(script)
      errors.add(:script, 'does not pass validation')
    end

    def command_line_validation(script)
      case script.filename
      when /\.rb$/ then system("ruby -wc #{script.path}")
      when /\.sh$/ then system("bash -n #{script.path}")
      else false
      end
    end
end
