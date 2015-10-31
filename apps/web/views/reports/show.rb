module Web::Views::Reports
  class Show
    include Web::View

    def repo_full_name
      "#{report.owner}/#{report.repo}"
    end

    def report_url
      routes.report_url(id: report.id)
    end
  end
end
