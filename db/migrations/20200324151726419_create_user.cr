class CreateUser < Jennifer::Migration::Base
  def up
    create_table(:users) do |t|
      t.string :email
      t.string :password_digest
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :first_name
      t.string :last_name
      t.string :old_password
      t.json :preferences
    end
  end

  def down
    drop_table(:users)
  end
end
