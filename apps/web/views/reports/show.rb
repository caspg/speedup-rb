module Web::Views::Reports
  class Show
    include Web::View

    def repo_full_name
      "#{report.owner} / #{report.repo}"
    end

    def report_full_url
      routes.report_url(id: report.id)
    end

    def fasterer_offences
      report.content['fasterer_offences']
    end
  end
end
