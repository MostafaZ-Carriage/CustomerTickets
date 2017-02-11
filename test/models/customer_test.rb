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
    assert user_can_respond_to?(:created_tickets)
  end

  test 'A Customer can access his tickets'do
    customer = create(:customer_with_tickets, creator: create(:admin))
    assert customer.created_tickets==Ticket.where(creator: customer)
  end

  test 'A Customer can not has customer creator' do
    assert_not build(:customer_creates_customer).save
  end

  test 'A Customer has admin creator' do
    assert build(:admin_creates_customer, creator: create(:admin)).save
  end

  test 'A Customer can not has agent creator' do
    assert_not build(:agent_creates_customer, creator: create(:admin_creates_agent, creator: create(:admin))).save
  end

  test 'A Customer can not has non user creator' do
    assert build(:customer).save
  end

  private

  def user_can_respond_to?(method_name)
    obj_can_respond_to?(@new_customer, method_name)
  end
end