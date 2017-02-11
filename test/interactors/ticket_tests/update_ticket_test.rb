require 'test_helper'
class UpdateTicketTest < ActiveSupport::TestCase

  setup do
    @existing_ticket = create(:ticket_customer).as_json.symbolize_keys!.merge(title: 'New Name')
  end

  teardown do
    Ticket.destroy_all
  end

  test 'Update Ticket interactor exists' do
    class_exists?(UpdateTicket)
  end

  test 'successful update' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: @existing_ticket, current_user: create(:admin_creates_agent))
    assert result.success?
    assert result.response[:ticket][:title]==Ticket.last.title
  end

  test 'unsuccessful update' do
    result = UpdateTicket.call(response: {}, ticket: @existing_ticket, current_user: create(:admin_creates_agent))
    assert_not result.success?
    assert_nil result.response[:ticket]
  end

  test 'agent successfully close ticket' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: close_ticket!, current_user: create(:admin_creates_agent))
    assert result.success?
    assert result.response[:ticket][:title]==Ticket.last.title
  end

  test 'admin successfully close ticket' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: close_ticket!, current_user: create(:admin))
    assert result.success?
    assert result.response[:ticket][:title]==Ticket.last.title
  end

  test 'customer unsuccessfully close ticket' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: close_ticket!, current_user: create(:customer, email: 'cosutmer2@costumer.customer'))
    assert_not result.success?
    assert_nil result.response[:ticket]
  end

  private

  def close_ticket!
    @existing_ticket[:status] = TicketStatus::CLOSE
    @existing_ticket
  end
end