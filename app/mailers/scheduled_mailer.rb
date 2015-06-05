class ScheduledMailer < ApplicationMailer
  default from: 'noreply.tasker@bernardo.me'

  def fatal(recipients, error, subject = 'Fatal Error from Tasker')
    @error = error
    mail to: recipients, subject: subject
  end

  def errors(recipients, subject = 'Daily Error Log from Tasker')
    @errors = Logs.where(created_at: 1.day.ago, severity: 'error')
    return false if @errors.empty?
    mail to: recipients, subject: subject << " (#{@errors.length})"
  end

  def failed(recipients, subject = 'Hourly Failed report from Tasker')
    @failed = Instance.where(created_at: 1.hour.ago, failed: true)
    return false if @failed.empty?
    mail to: recipients, subject: subject << " (#{@failed.length})"
  end
end
