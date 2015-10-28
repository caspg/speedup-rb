Lotus::Model.migration do
  change do
    alter_table :reports do
      add_column :url_uuid, String, null: true
      add_column :form_uuid, String, null: false
    end
  end
end
