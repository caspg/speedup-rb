module Web::Views::Reports
  class Show
    include Web::View

    def repo_full_name
      "#{report.owner}/#{report.repo}"
    end
  end
end
