# require 'test_helper'
# class FindAdminTest < ActiveSupport::TestCase
#
#   test 'Find Admin interactor exists' do
#     class_exists?(FindAdmin)
#   end
#
#   test 'successful find' do
#     new_admin_id = create(:admin).id
#     result = FindAdmin.call(response: {authenticated: true}, id: new_admin_id)
#     assert result.success?
#     assert result.response[:admin][:id]==new_admin_id
#   end
#
#   test 'unsuccessful find' do
#     result = FindAdmin.call(response: {authenticated: true}, id: -1)
#     assert_not result.success?
#     assert_nil result.response[:admin]
#   end
# end