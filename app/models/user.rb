class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User, AuthorizedByCreator

  def self.can_create_ticket?
    false
  end

  def self.can_close_ticket?
    false
  end

  def self.can_create_admin?
    false
  end

  def self.can_create_customer?
    false
  end

  def self.can_create_agent?
    false
  end

  def self.can_create_user?
    false
  end
end