module Recurring
  # Default
  class Tracked < Base
    def initialize(options = {})
      @task = options.delete(:task).id
    end

    # Delayed hooks into this
    def perform
      start_instance
      begin; run; rescue; @failed = true; end
      finish_instance
    end

    private

      # Track when our task started
      def start_instance
        @instance = Task.find(@task).instances.create
      end

      # Run our task
      def run
        puts "# Usage:\nclass MyClass < Tracked\n"\
             "  def run\n    do something\n  end\nend"
      end

      # Track when our instance ended/failed
      def finish_instance
        @instance.finished_at = Time.now
        @failed && @instance.failed
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
