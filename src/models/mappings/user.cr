class User < ApplicationRecord
  mapping(
    email: {type: String?, default: ""},
    password_digest: {type: String?},
    first_name: {type: String?},
    last_name: {type: String?},
    old_password: {type: String?},
    preferences: {type: JSON::Any?},
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
end
