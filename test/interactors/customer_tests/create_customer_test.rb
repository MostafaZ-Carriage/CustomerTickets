# require 'test_helper'
# class CreateCustomerTest < ActiveSupport::TestCase
#
#   teardown do
#     Customer.destroy_all
#   end
#
#   test 'Create Customer interactor exists' do
#     class_exists?(CreateCustomer)
#   end
#
#   test 'successful create' do
#     result = CreateCustomer.call(response: {authenticated: true}, customer: build(:customer).as_json.merge(password: '12312321312'))
#     assert result.success?
#     assert result.response[:customer][:id]==Customer.last.id
#   end
#
#   test 'unsuccessful create' do
#     result = CreateCustomer.call(response: {authenticated: true}, customer: build(:customer).as_json)
#     assert_not result.success?
#     assert_nil result.response[:customer]
#   end
# end