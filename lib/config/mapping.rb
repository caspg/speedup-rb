collection :reports do
  entity     Report
  repository ReportRepository

  attribute :id,         Integer
  attribute :owner,      String
  attribute :repo,       String
end
