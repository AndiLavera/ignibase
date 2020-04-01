class CreateAppUser < Jennifer::Migration::Base
  def up
    create_table(:apps_users) do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.reference :user
      # t.reference :app
      t.string :app_id
    end

    add_foreign_key(:apps_users, :apps, :app_id, :uuid)
  end

  def down
    drop_table :apps_users
  end
end
