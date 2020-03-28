class CreateApp < Jennifer::Migration::Base
  def up
    create_table(:apps) do |t|
      t.string :name
      t.string :uuid
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def down
    drop_table :apps
  end
end
