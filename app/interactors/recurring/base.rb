module Recurring
  # Default
  class Base
    include Delayed::RecurringJob
    run_at(Time.now + 5)

    def initialize(options = {})
      @task = options.delete(:task).id
    end

    # Delayed hooks into this
    def perform
      start_instance
      run
      finish_instance
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

      # Overwriting defaults
      class << self
        def schedule(options = {})
          @options = options
          super
        end

        def schedule!(options = {})
          return unless Delayed::Worker.delay_jobs
          unschedule
          new(options).schedule!(options)
        end

        def unschedule(options = {})
          @options = options
          super()
        end

        private

          def jobs
            super.where(queue: @options[:queue])
          end
      end
  end
end
