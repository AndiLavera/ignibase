class User < ApplicationRecord
  mapping(
    email: { type: String?, default: ""},
    password_digest: { type: String? },
    full_name: { type: String? },
    old_password: { type: String? },
    preferences: { type: JSON::Any? }

    # Uncomment these for the Confirmable
    # confirmation_token: { type: String?, null: true },
    # confirmed: { type: Bool, null: true },
    # confirmed_at: { type: Time, null: true },
    # confirmation_sent_at: { type: Time, null: true },
    # unconfirmed_email: { type: String? },

    # Uncomment for Omniauthable
    # uid: { type: String? },

    # Uncomment for Trackable
    # sign_in_count: { type: Int32, default: 0, null: false },
    # current_sign_in_ip: { type: String? },
    # last_sign_in_ip: { type: String? },
    # current_sign_in_at: { type: Time?, null: true },
    # last_sign_in_at: { type: Time?, null: true },

    # Uncomment for recoverable
    # reset_password_sent_at: { type: Time? },
    # reset_password_token: { type: String? },
    # password_reset_in_progress: { type: Bool?, default: false },

    # Uncomment for lockable
    # locked_at: { type: Time? },
    # failed_attempts: { type: Int32, default: 0, null: false  },
    # unlock_token: { type: String? },

    # Uncomment for Invitable
    # invitation_accepted_at: { type: Time? },
    # invitation_created_at: { type: Time? },
    # invitation_token: { type: String? },
    # invited_by: { type: Int64? },
    # invitation_sent_at: { type: Time? },
  )

  include Mochi
  mochi_jennifer(
    :authenticable,
    # :confirmable,
    # :trackable,
    # :omniauthable,
    # :recoverable,
    # :lockable,
    # :invitable
  )

  has_and_belongs_to_many :apps, App

  def create_user_and_app_user(params : Amber::Validators::Params)
    @full_name = params["full_name"] if params["full_name"]
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
    self.full_name = params["full_name"] if params["full_name"]
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
