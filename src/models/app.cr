require "uuid"

class App < ApplicationRecord
  belongs_to :owner, User, primary: :id, foreign: :user_id
  has_and_belongs_to_many :accounts, :user_id
  has_many :keys, APIKey

  validates_presence :name
  validates_uniqueness :uuid

  before_validation :generate_uuid

  def valid_user?(current_user : User | Nil)
    return false if current_user.nil?

    self.user_id == current_user.id
  end

  private def generate_uuid
    self.uuid = UUID.new(UUID.random).hexstring
  end
end
