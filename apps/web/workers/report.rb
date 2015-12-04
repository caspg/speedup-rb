module Web::Workers
  class Report
    include Sidekiq::Worker
    sidekiq_options :retry => false

    def perform(report_id)
      Web::Services::ReportWorkerFlow.new(report_id).call
    end
  end
end
