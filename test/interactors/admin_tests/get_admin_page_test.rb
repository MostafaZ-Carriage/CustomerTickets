# require 'test_helper'
# class GetAdminPageTest < ActiveSupport::TestCase
#
#   setup do
#     (0...BULK_CREATE_SIZE).each { |i| create(:admin, email: "xxxx#{i}@xxx.xxx") }
#   end
#
#   test 'Get Admin Page interactor exists' do
#     class_exists?(GetAdminPage)
#   end
#
#   test 'send page' do
#     result = GetAdminPage.call(response: {authenticated: true}, page: 1, per_page: BULK_CREATE_SIZE-1)
#     assert result.success?
#     assert result.response[:admins].size == BULK_CREATE_SIZE-1
#   end
#
#   test 'Do not send page' do
#     result = GetAdminPage.call(response: {authenticated: true})
#     assert result.success?
#     assert result.response[:admins].size == (BULK_CREATE_SIZE+1)
#   end
# end