module Web::Views::Reports
  class Create
    include Web::View
    include Web::Views::EasyErrors
    template 'home/index'
  end
end
