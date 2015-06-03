# Each log message of a task
class Log < ActiveRecord::Base
  belongs_to :instance
  validates :severity, :message, presence: true
  validates_inclusion_of :severity, in: %w(info warn error fatal)
end
