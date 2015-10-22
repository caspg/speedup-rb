Lotus::Model.migration do
  change do
    alter_table :reports do
      drop_column :report_url
    end
  end
end
