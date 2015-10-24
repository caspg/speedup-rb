module Web::Workers
  class Report
    include Sidekiq::Worker

    def perform(report_id)
    end
  end
end
