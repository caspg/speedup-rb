module Web::Controllers::Reports
  class Show
    include Web::Action
    expose :report

    params do
      param :id, type: Integer, presence: true
    end

    def call(params)
      @report = find_report
      halt 404 unless @report
    end

    private

    def report_id
      @report_id ||= params[:id]
    end

    def find_report
      ReportRepository.find(report_id)
    end
  end
end
