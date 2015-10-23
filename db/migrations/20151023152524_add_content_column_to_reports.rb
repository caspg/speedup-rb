Lotus::Model.migration do
  change do
    alter_table :reports do
      add_column :content, JSON, null: true
    end
  end
end
