class Report
  include Lotus::Entity
  attributes :owner, :repo, :path, :content, :url_uuid, :form_uuid
end
