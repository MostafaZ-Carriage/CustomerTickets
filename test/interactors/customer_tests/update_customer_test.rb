require 'test_helper'
class UpdateCustomerTest < ActiveSupport::TestCase

  setup do
    @new_name = 'New Name'
  end

  teardown do
    Customer.destroy_all
  end

  test 'Update Customer interactor exists' do
    class_exists?(UpdateCustomer)
  end

  test 'successful update' do
    result = UpdateCustomer.call(response: {authenticated: true}, customer: create(:customer).as_json.merge(name: @new_name).symbolize_keys!)
    assert result.success?
    assert result.response[:customer][:name]==Customer.last.name
  end

  test 'unsuccessful update' do
    customer_obj = create(:customer).as_json.symbolize_keys!
    customer_obj[:id] = -1
    result = UpdateCustomer.call(response: {authenticated: true}, customer: customer_obj)
    assert_not result.success?
    assert_nil result.response[:customer]
  end
end