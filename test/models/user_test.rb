require 'test_helper'
class UserTest < ActiveSupport::TestCase
  setup do
    @new_user = User.new
    @existing_user = users(:mostafa)
  end

  test 'User class exists' do
    assert class_exists?(User)
  end

  private

  def user_has_attribute?(attribute_name)
    obj_has_attribute?(@new_user, attribute_name)
  end
end