require './lib/ext/pg_json'

collection :reports do
  entity     Report
  repository ReportRepository

  attribute :id,         Integer
  attribute :owner,      String
  attribute :repo,       String
  attribute :path,       String
  attribute :content,    PGJSON
  attribute :form_uuid,  String
  attribute :url_uuid,   String
  attribute :email,      String
end
