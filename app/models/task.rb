# Tasks as internal or external scripts
class Task < ActiveRecord::Base
  has_many :instances
  mount_uploader :script, ScriptUploader

  # Ensure the task is queued
  after_create :schedule_task
  after_update :reschedule_task

  validates :name, presence: true
  validates :external, inclusion: { in: [true, false] }

  # Internal scripts need a file and an interval/scalar
  with_options if: :internal do
    validate :script_validation
    validates :script, :scalar, presence: true
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

  private

    def schedule_task
      Recurring::Script.schedule(self, run_every: run_every, script: script.path)
    end

    def reschedule_task
      Recurring::Script.reschedule(self, run_every: run_every, script: script.path)
    end

    def script_validation
      return if command_line_validation(script)
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
