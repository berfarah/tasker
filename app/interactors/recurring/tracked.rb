module Recurring
  # Default
  class Tracked < Base
    def initialize(options = {})
      @task = options.delete(:task).id
    end

    # Delayed hooks into this
    def perform
      start_instance
      run
      finish_instance
    rescue => e
      ScheduledMailer.fatal('bfarah@walmart.com', e).deliver_now
      raise e
    end

    private

      # Track when our task started
      def start_instance
        @instance = Task.find(@task).instances.create
      end

      # Run our task
      def run; end

      # Track when our instance ended/failed
      def finish_instance
        @instance.finished_at = Time.now
        @instance.failed = @failed if @failed
        @instance.save!
      end

      # Log to our database with corresponding severity
      def log(severity, message)
        return if message.nil?
        Rails.logger.info message
        @instance.logs.create(severity: severity, message: message)
      end
  end
end
