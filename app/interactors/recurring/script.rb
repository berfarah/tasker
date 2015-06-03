module Recurring
  # Recurring scripts
  class Script
    include Delayed::RecurringJob

    def initialize(task, options = {})
      @task = task
      @name = "#{@task.name}#{@task.id}".capitalize
      @options = options
      @script  = options.delete(:script)
      @options[:queue] = @name.downcase
      @options[:run_at] = Time.now + 5
    end

    # Quick shorthand for updates
    def self.reschedule(options = {})
      unschedule(options)
      schedule(options)
    end

    def perform
      start_instance
      run script
      finish_instance
    end

    def unschedule
      Object.const_get(@name).unschedule
    end

    private

      def run(script)
        # app/interactors/actions/shell.rb captures output in real time
        Actions::Shell.run(script) do |out, err|
          log :info,  out
          log :error, err
        end
      rescue @failed = true
      end

      # Track when our task started
      def start_instance
        @instance = @task.instance.create
      end

      # Track when our instance ended/failed
      def finish_instance
        @instance.finished_at = Time.now
        @instance.failed = @failed
        @instance.save!
      end

      # Log to our database with corresponding severity
      def log(severity, message)
        return if message.nil?
        Rails.logger.info message
        @task.log.new(severity: severity, message: message)
      end
  end
end
