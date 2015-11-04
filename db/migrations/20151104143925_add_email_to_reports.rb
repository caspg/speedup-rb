Lotus::Model.migration do
  change do
    alter_table :reports do
      add_column :email, String, null: true
    end
  end
end
