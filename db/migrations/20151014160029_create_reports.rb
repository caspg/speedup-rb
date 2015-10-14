Lotus::Model.migration do
  change do
    create_table :reports do
      primary_key :id
      column :owner,      String, null: false
      column :repo,       String, null: false
      column :report_url, String, null: false
    end
  end
end
