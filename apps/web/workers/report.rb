module Web::Workers
  class Report
    include Sidekiq::Worker

    def perform(report_id)
      Web::Services::ReportWorkerFlow.new(report_id).call
    end
  end
end
