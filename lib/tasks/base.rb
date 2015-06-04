module Tasks
  module Base
    def run_every
      interval.send(scalar.to_sym)
    end

    private

      # Schedule using opts
      def update_scheduled; end

      def unschedule; end

      def schedule_opts
        { run_every: run_every }
      end
  end
end
