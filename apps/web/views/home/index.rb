require_relative '../easy_errors'

module Web::Views::Home
  class Index
    include Web::View
    include Web::Views::EasyErrors
  end
end
