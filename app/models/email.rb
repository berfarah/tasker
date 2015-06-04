require 'tasks/base'

class Email < ActiveRecord::Base
  include Tasks::Base

  # Ensure the task is queued
  after_save :update_scheduled
  after_destroy :unschedule

  def recipients_array
    recipients.split(/\s*[,;]\s*/)
  end

  def recipients_sentence
    recipients_array.to_sentence
  end

  private

    def update_scheduled
      return unschedule unless enabled
      Recurring::Email.schedule(schedule_opts)
    end

    def unschedule
      Recurring::Email.unschedule(schedule_opts)
    end

    def schedule_opts
      super.merge(
        queue: 'email',
        report: report,
        recipients: recipients,
        subject: name)
    end
end
