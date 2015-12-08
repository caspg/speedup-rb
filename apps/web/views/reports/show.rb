module Web::Views::Reports
  class Show
    include Web::View

    def report_path
      ensure_backslash(report.path) unless report.path =~ /\.rb$/
    end

    def empty_content?
      report.content.nil? || fasterer_offences.empty? && fasterer_parse_errors.empty? && fasterer_api_errors.empty?
    end

    def repo_full_name
      "#{report.owner} / #{report.repo}"
    end

    def report_full_url
      routes.report_url(id: report.id)
    end

    def fasterer_offences
      report.content['fasterer_offences']
    end

    def url_to_github(path, line = nil)
      line_param = line.nil? ? nil : "#L#{line}"
      "https://github.com/#{report.owner}/#{report.repo}/blob/master/#{path}#{line_param}"
    end

    def pretty_title(offence)
      fasterer_offences_details[offence.to_sym][:pretty_title]
    end

    def offence_explanaition(offence)
      fasterer_offences_details[offence.to_sym][:explanation]
    end

    def url_to_fast_ruby_repo(offence)
      anchor = fasterer_offences_details[offence.to_sym][:fast_ruby_repo]
      "https://github.com/JuanitoFatas/fast-ruby##{anchor}"
    end

    def fasterer_parse_errors
      report.content['errors']
    end

    def fasterer_api_errors
      report.content['api_errors']
    end

    private

    def fasterer_offences_details
      @fasterer_offences_details ||= Web::Views::FastererOffences.details
    end

    def ensure_backslash(report_path)
      return report_path if report_path[-1] == '/'
      "#{report_path}/"
    end
  end
end
