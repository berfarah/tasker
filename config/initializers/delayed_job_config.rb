Delayed::Worker.sleep_delay = 30.seconds
Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
Delayed::Worker.raise_signal_exceptions = :term
Delayed::Worker.default_queue_name = 'default'
