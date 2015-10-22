module Web::Controllers::Reports
  class Show
    include Web::Action

    expose :report

    params do
      param :id, type: Integer, presence: true
    end

    def call(params)
      @report = ReportRepository.find(params[:id])
    end
  end
end
