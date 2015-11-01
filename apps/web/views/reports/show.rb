module Web::Views::Reports
  class Show
    include Web::View

    def empty_content?
      fasterer_offences.empty? && fasterer_parse_errors.empty? && fasterer_api_errors.empty?
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

    def url_to_github(occurrence, line)
      "https://github.com/#{report.owner}/#{report.repo}/blob/master/#{occurrence['path']}#L#{line}"
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
  end
end
