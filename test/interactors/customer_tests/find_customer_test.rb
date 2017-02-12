# require 'test_helper'
# class FindCustomerTest < ActiveSupport::TestCase
#
#   test 'Find Customer interactor exists' do
#     class_exists?(FindCustomer)
#   end
#
#   test 'successful find' do
#     new_customer_id = create(:customer).id
#     result = FindCustomer.call(response: {authenticated: true}, id: new_customer_id)
#     assert result.success?
#     assert result.response[:customer][:id]==new_customer_id
#   end
#
#   test 'unsuccessful find' do
#     result = FindCustomer.call(response: {authenticated: true}, id: -1)
#     assert_not result.success?
#     assert_nil result.response[:customer]
#   end
# end