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

  private

  def user_has_attribute?(attribute_name)
    obj_has_attribute?(@new_customer, attribute_name)
  end
end