Lotus::Model.migration do
  change do
    alter_table :reports do
      add_column :path, String, null: true
    end
  end
end
