module Web::Services
  class ReportWorkerFlow
    MINIMAL_RATE_LIMIT = 1000
    RESET_TIME_OFFEST = 30 # in seconds

    def initialize(report_id)
      @report_id = report_id
    end

    def call
      fetch_rate_limits
      rate_limit_to_low? ? schedule_analyzer : call_analyzer
    end

    private

    attr_reader :report_id, :remaining_rate_limit, :reset_time

    def fetch_rate_limits
      rate_limit_data = Web::Services::ApiRateLimits.new.fetch_data

      @remaining_rate_limit = rate_limit_data[:remaining]
      @reset_time = rate_limit_data[:reset] + RESET_TIME_OFFEST
    end

    def rate_limit_to_low?
      remaining_rate_limit < MINIMAL_RATE_LIMIT
    end

    def schedule_analyzer
      Web::Workers::Report.perform_at(reset_time, report_id)
    end

    def call_analyzer
      Web::Services::RepoAnalyzer.new(report_id).call
    end
  end
end
