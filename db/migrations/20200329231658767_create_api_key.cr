class CreateApiKey < Jennifer::Migration::Base
  def up
    create_table(:api_keys) do |t|
      t.reference :app
      t.string :key
      t.string :environment
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def down
    drop_table :api_keys
  end
end
