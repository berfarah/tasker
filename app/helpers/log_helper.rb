module LogHelper
  def severity_class(severity)
    { info: '',
      warn: 'warning',
      error: 'danger',
      fatal: 'danger' }[severity.to_sym]
  end

  def time_to_complete(duration)
    'Took ' << duration.human_time << ' to complete'
  end

  def time_format(time)
    I18n.l time.localtime, format: :human
  end

  def time_default(time)
    I18n.l time.localtime, format: :default
  end
end
