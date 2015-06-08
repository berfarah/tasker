# Each log message of a task
class Log < ActiveRecord::Base
  belongs_to :instance
  validates :severity, :message, presence: true
  validates_inclusion_of :severity, in: %w(info warn error fatal)

  scope :errors, -> { where(severity: 'error') }
  scope :on_day, lambda(date) do
    where(created_at: date.beginning_of_day..date.end_of_day)
  end
end
