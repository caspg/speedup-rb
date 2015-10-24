module Web::Services
  class RepoAnalyzer
    def initialize(report_id)
      @report = ReportRepository.find(report_id)
    end

    def call
      results = analyze_repo
      update_report(results)
    end

    private

    attr_reader :report

    def analyze_repo
      Fasterer::Github.scan(report.owner, report.repo, report.path)
    end

    def update_report(results)
      report.content = results
      ReportRepository.update(report)
    end
  end
end
