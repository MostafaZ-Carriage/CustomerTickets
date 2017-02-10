require 'test_helper'
class CreateAdminTest < ActiveSupport::TestCase

  teardown do
    Admin.destroy_all
  end

  test 'Create Admin interactor exists' do
    class_exists?(CreateAdmin)
  end

  test 'successful create' do
    result = CreateAdmin.call(response: {authenticated: true}, admin: build(:admin).as_json.merge(password: '12312321312'))
    assert result.success?
    assert result.response[:admin][:id]==User.last.id
  end

  test 'unsuccessful create' do
    result = CreateAdmin.call(response: {authenticated: true}, admin: build(:admin).as_json)
    assert_not result.success?
    assert_nil result.response[:admin]
  end
end