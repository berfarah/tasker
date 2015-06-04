class ScheduledMailer < ApplicationMailer
  default from: 'noreply.tasker@bernardo.me'

  def errors
    # @errors = f
  end

  def failed(recipients, subject = 'Hourly Failed report from Tasker')
    @failed = Instance.where(created_at: 1.hour.ago, failed: true)
    return false if @failed.empty?
    mail to: recipients, subject: subject << " (#{@failed.length})"
  end
end
