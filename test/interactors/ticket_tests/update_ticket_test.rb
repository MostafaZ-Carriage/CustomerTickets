require 'test_helper'
class UpdateTicketTest < ActiveSupport::TestCase

  setup do
    @new_title = 'New Name'
  end

  teardown do
    Ticket.destroy_all
  end

  test 'Update Ticket interactor exists' do
    class_exists?(UpdateTicket)
  end

  test 'successful update' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: create(:ticket).as_json.merge(title: @new_title).symbolize_keys!)
    assert result.success?
    assert result.response[:ticket][:title]==Ticket.last.title
  end

  test 'unsuccessful update' do
    ticket_obj = create(:ticket).as_json.symbolize_keys!
    ticket_obj[:id] = -1
    result = UpdateTicket.call(response: {authenticated: true}, ticket: ticket_obj.symbolize_keys!)
    assert_not result.success?
    assert_nil result.response[:ticket]
  end
end