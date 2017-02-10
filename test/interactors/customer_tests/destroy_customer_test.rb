require 'test_helper'
class DestroyCustomerTest < ActiveSupport::TestCase

  setup do
    @customer_to_destroy_id = create(:customer).id
  end

  teardown do
    Customer.destroy_all
  end

  test 'Destroy Customer interactor exists' do
    class_exists?(DestroyCustomer)
  end

  test 'successful destroy' do
    result = DestroyCustomer.call(response: {authenticated: true}, id: @customer_to_destroy_id)
    assert result.success?
    assert_nil Customer.find_by_id(@customer_to_destroy_id)
  end

  test 'unsuccessful destroy' do
    result = DestroyCustomer.call(response: {}, id: @customer_to_destroy_id)
    assert_not result.success?
    assert_nil result.response[:customer]
  end
end