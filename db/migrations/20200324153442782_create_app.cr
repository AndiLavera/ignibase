class CreateApp < Jennifer::Migration::Base
  def up
    create_table(:apps) do |t|
      t.string :name
      t.string(:uuid, {:null => false})
      # t.string :uuid
      t.timestamp :created_at
      t.timestamp :updated_at
      t.reference :user
    end
    add_index(:apps, :uuid, type: :uniq, order: :asc)
  end

  def down
    drop_table :apps
  end
end
