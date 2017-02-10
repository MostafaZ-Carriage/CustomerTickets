require 'test_helper'
class CustomerTest < ActiveSupport::TestCase

  setup do
    @new_customer = Customer.new
  end

  test 'Customer class exists' do
    assert class_exists?(Customer)
  end

  test 'Type should equal to Customer' do
    assert @new_customer.type == 'Customer'
  end

  test 'A Customer has tickets' do
    assert user_can_respond_to?(:tickets)
  end

  test 'A Customer can access his tickets'do
    assert_not create(:customer_with_tickets).tickets.empty?
  end

  private

  def user_can_respond_to?(method_name)
    obj_can_respond_to?(@new_customer, method_name)
  end
end