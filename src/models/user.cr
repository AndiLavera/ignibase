class User < ApplicationRecord
  include Mochi
  mochi_jennifer(
    :authenticable, # :confirmable, :trackable,
    # :omniauthable, :recoverable, :lockable, :invitable
  )

  has_and_belongs_to_many :apps, App

  def create_user_and_app_user(params : Amber::Validators::Params)
    @first_name = params["first_name"] if params["first_name"]
    @last_name = params["last_name"] if params["last_name"]
    if params["email"]
      @email = params["email"]
    else
      errors.add(:email, "is not present")
    end
    digest_password(params)
  end

  def create_user_and_app_user!(params : Amber::Validators::Params)
    create_user_and_app_user(params)

    User.transaction do
      self.save
      app_user = AppsUsers.new
      app_user.app_id = params["app_id"].to_i32
      app_user.user_id = self.id
      app_user.save
      app_user
    end
  end

  # Check if password & password_confirmation are the same,
  # then hashes the password for saving
  def digest_password(params : Amber::Validators::Params)
    password_confirmation = params["password_confirmation"]

    if params["password"] == password_confirmation
      self.password = params["password"]
    else
      errors.add(:password, "Passwords do not match.")
    end
  end

  # Updates attributes of the account && saves
  #
  # Does NOT update app_id or preferences
  def update_information!(params : Amber::Validators::Params)
    update_information(params)
    save

    self
  end

  # Updates preferences of the account && saves
  #
  # Does NOT update anything other than preferences
  def update_preferences!(params : Amber::Validators::Params)
    update_preferences(params)
    save

    self
  end

  # This is the main authentication method
  #
  # All controllers should invoke this method
  # to verify the supplied password is correct
  def authenticate(password : String?)
    return false if password.nil?

    valid_password?(password)
  end

  # Sets any attributes of the account
  #
  # Only sets attributes if the key exists
  private def update_information(params : Amber::Validators::Params)
    self.first_name = params["first_name"] if params["first_name"]
    self.last_name = params["last_name"] if params["last_name"]
    self.email = params["email"] if params["email"]

    if params["password"] && params["password_confirmation"]
      digest_password(params)
    end
  end

  # Sets any attributes of the account
  #
  # Only sets attributes if the key exists
  # TODO
  private def update_preferences(params : Amber::Validators::Params)
  end
end
