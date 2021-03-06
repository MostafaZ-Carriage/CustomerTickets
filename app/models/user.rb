class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User
  thread_mattr_accessor :sign_in_action, :sign_out_action

  before_save :skip_confirmation!

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

  def can_update_user?(user)
    false
  end

  def can_update_admin?(user)
    false
  end

  def can_update_agent?(user)
    false
  end

  def can_update_customer?(user)
    false
  end

  def can_update_ticket?(ticket)
    false
  end

  def can_destroy_user?(user)
    false
  end

  def can_destroy_admin?(user)
    false
  end

  def can_destroy_agent?(user)
    false
  end

  def can_destroy_customer?(user)
    false
  end

  def can_destroy_ticket?(user)
    false
  end
end