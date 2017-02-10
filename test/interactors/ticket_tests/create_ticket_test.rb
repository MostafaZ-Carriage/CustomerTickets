require 'test_helper'
class CreateTicketTest < ActiveSupport::TestCase

  teardown do
    Ticket.destroy_all
  end

  test 'Create Ticket interactor exists' do
    class_exists?(CreateTicket)
  end

  test 'customer successfully create' do
    result = CreateTicket.call(response: {authenticated: true}, ticket: build(:ticket).as_json, current_user: create(:customer))
    assert result.success?
    assert result.response[:ticket][:id]==Ticket.last.id
  end

  test 'unsuccessful create' do
    result = CreateTicket.call(response: {authenticated: true}, ticket: build(:ticket).as_json)
    assert_not result.success?
    assert_nil result.response[:ticket]
  end
end