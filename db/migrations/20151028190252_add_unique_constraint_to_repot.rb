Lotus::Model.migration do
  change do
    alter_table :reports do
      add_unique_constraint :form_uuid
    end
  end
end
