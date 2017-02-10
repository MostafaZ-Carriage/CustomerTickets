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
    result = UpdateTicket.call(response: {authenticated: true}, ticket: @existing_ticket)
    assert result.success?
    assert result.response[:ticket][:title]==Ticket.last.title
  end

  test 'unsuccessful update' do
    result = UpdateTicket.call(response: {}, ticket: @existing_ticket)
    assert_not result.success?
    assert_nil result.response[:ticket]
  end
end