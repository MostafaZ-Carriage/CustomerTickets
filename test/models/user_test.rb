require 'test_helper'
class UserTest < ActiveSupport::TestCase
  setup do
    @new_user = User.new
  end

  test 'User class exists' do
    assert class_exists?(User)
  end

  test 'A user has first name' do
    assert user_has_attribute?(:first_name)
  end

  test 'A user has last name' do
    assert user_has_attribute?(:last_name)
  end

  test 'A user has email' do
    assert user_has_attribute?(:email)
  end

  test 'A user has created_at' do
    assert user_has_attribute?(:created_at)
  end

  test 'A user has updated_at' do
    assert user_has_attribute?(:updated_at)
  end

  private

  def user_has_attribute?(attribute_name)
    @new_user.has_attribute?(attribute_name)
  end
end