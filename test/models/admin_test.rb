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
    assert user_can_respond_to?(:open_tickets)
  end

  test 'An Admin can access his open tickets'do
    admin = create(:admin_with_open_tickets)
    assert admin.open_tickets==Ticket.where(creator: admin)
  end

  test 'An Admin has closed tickets' do
    assert user_can_respond_to?(:closed_tickets)
  end

  test 'An Admin can access his closed tickets'do
    admin = create(:admin_with_closed_tickets)
    assert admin.closed_tickets==Ticket.where(closer: admin)
  end

  private

  def user_has_attribute?(attribute_name)
    obj_has_attribute?(@new_admin, attribute_name)
  end

  def user_can_respond_to?(method_name)
    obj_can_respond_to?(@new_admin, method_name)
  end
end