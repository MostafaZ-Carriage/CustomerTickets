require 'test_helper'
class AdminTest < ActiveSupport::TestCase

  setup do
    @new_admin = Admin.new
  end

  test 'Admin class exists' do
    assert class_exists?(Admin)
  end

  test 'Type should equal to Admin' do
    assert @new_admin.type == 'Admin'
  end

  private

  def user_has_attribute?(attribute_name)
    obj_has_attribute?(@new_admin, attribute_name)
  end
end