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
        new_report = Report.new(params[:report])
        report = ReportRepository.create(new_report)

        redirect_to routes.report_path(id: report.id)
      end
    end
  end
end

