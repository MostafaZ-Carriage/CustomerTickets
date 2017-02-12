# require 'test_helper'
# class UpdateAdminTest < ActiveSupport::TestCase
#
#   setup do
#     @new_name = 'New Name'
#   end
#
#   teardown do
#     Admin.destroy_all
#   end
#
#   test 'Update Admin interactor exists' do
#     class_exists?(UpdateAdmin)
#   end
#
#   test 'successful update' do
#     admin = create(:admin)
#     result = UpdateAdmin.call(response: {authenticated: true}, admin: admin.as_json.merge(name: @new_name).symbolize_keys!, current_user: admin)
#     assert result.success?
#     assert result.response[:admin][:name]==Admin.last.name
#   end
#
#   test 'unsuccessful update' do
#     admin_obj = create(:admin).as_json.symbolize_keys!
#     admin_obj[:id] = -1
#     result = UpdateAdmin.call(response: {authenticated: true}, admin: admin_obj.symbolize_keys!)
#     assert_not result.success?
#     assert_nil result.response[:admin]
#   end
# end