module Web::Controllers::Reports
  class Create
    include Web::Action

    params do
      param :report do
        param :owner, presence: true
        param :repo,  presence: true
      end
    end

    def call(params)
      if params.valid?
        report = create_new_report
        Workers::Report.perform_async(report.id)

        redirect_to routes.report_path(id: report.id)
      end
    end

    private

    def create_new_report
      new_report = Report.new(params[:report])
      ReportRepository.create(new_report)
    end
  end
end
