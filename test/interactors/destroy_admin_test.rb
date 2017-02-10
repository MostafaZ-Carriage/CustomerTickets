require 'test_helper'
class DestroyAdminTest < ActiveSupport::TestCase

  setup do
    @admin_to_destroy_id = create(:admin).id
  end

  teardown do
    Admin.destroy_all
  end

  test 'Destroy Admin interactor exists' do
    class_exists?(DestroyAdmin)
  end

  test 'successful destroy' do
    result = DestroyAdmin.call(response: {authenticated: true}, id: @admin_to_destroy_id)
    assert result.success?
    assert_nil Admin.find_by_id(@admin_to_destroy_id)
  end

  test 'unsuccessful destroy' do
    result = DestroyAdmin.call(response: {}, id: @admin_to_destroy_id)
    assert_not result.success?
    assert_nil result.response[:admin]
  end
end