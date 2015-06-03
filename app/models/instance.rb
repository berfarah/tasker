require 'helpers/parse_time'

# Each instance of a Task
class Instance < ActiveRecord::Base
  belongs_to :task
  has_many :logs
  validate :not_negative_duration

  def duration
    return 0 unless [finished_at, created_at].all?(&:present?)
    @duration ||= (finished_at - created_at).ceil.human_time
  end

  def started_at
    created_at
  end

  private

    def not_negative_duration
      errors.add(:finished_at, 'is before started_at') if duration < 0
    end
end
