require 'test_helper'
class AdminTest < ActiveSupport::TestCase

  setup do
    @new_admin = Admin.new
  end

  test 'Admin class exists' do
    assert class_exists?(Admin)
  end

  test 'Type should equal to Admin' do
    assert @new_admin.type == 'Admin'
  end

  test 'An Admin has open tickets' do
    assert user_can_respond_to?(:created_tickets)
  end

  test 'An Admin can access his open tickets'do
    admin = create(:admin_with_created_tickets)
    assert admin.created_tickets==Ticket.where(creator: admin)
  end

  test 'An Admin has closed tickets' do
    assert user_can_respond_to?(:closed_tickets)
  end

  test 'An Admin has creator' do
    assert user_can_respond_to?(:creator)
  end

  test 'An Admin can access his closed tickets'do
    admin = create(:admin_with_closed_tickets)
    assert admin.closed_tickets==Ticket.where(closer: admin)
  end

  test 'An Admin can not has customer creator' do
    assert_not build(:customer_creates_admin).save
  end

  test 'An Admin has admin creator' do
    assert build(:admin).save
  end

  test 'An Admin can not has agent creator' do
    assert_not build(:agent_creates_admin).save
  end

  test 'An Admin can not has non user creator unless it is the first admin' do
    assert build(:non_user_creates_admin).save
    assert_not build(:non_user_creates_admin).save
  end

  private

  def user_has_attribute?(attribute_name)
    obj_has_attribute?(@new_admin, attribute_name)
  end

  def user_can_respond_to?(method_name)
    obj_can_respond_to?(@new_admin, method_name)
  end
end