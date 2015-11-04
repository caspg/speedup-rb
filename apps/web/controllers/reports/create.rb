module Web::Controllers::Reports
  class Create
    include Web::Action
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    params do
      param :report do
        param :owner, presence: true, format: /^\S+$/
        param :repo,  presence: true, format: /^\S+$/
        param :path, format: /^\S*$/
        param :form_uuid
        param :email, format: VALID_EMAIL_REGEX
      end
    end

    def call(params)
      if params.valid?
        begin
          report = create_new_report
        rescue Sequel::UniqueConstraintViolation
          return nil
        end

        Web::Workers::Report.perform_async(report.id)
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
