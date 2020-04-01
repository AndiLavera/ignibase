require "uuid"

class App < ApplicationRecord
  has_and_belongs_to_many :users, User
  has_many :apps_users, AppsUsers, primary: :uuid, foreign: :app_id
  has_many :keys, APIKey

  validates_presence :name
  validates_uniqueness :uuid

  before_validation :generate_uuid

  def valid_user?(user : User | Nil)
    return false if user.nil?

    !!(AppsUsers
      .where {
        _app_id == self.uuid &&
        _user_id == user.id
      }.first)
  end

  private def generate_uuid
    self.uuid = UUID.new(UUID.random).hexstring
  end
end
