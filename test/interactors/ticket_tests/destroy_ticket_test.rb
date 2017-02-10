require 'test_helper'
class DestroyTicketTest < ActiveSupport::TestCase

  setup do
    @ticket_to_destroy_id = create(:ticket).id
  end

  teardown do
    Ticket.destroy_all
  end

  test 'Destroy Ticket interactor exists' do
    class_exists?(DestroyTicket)
  end

  test 'successful destroy' do
    result = DestroyTicket.call(response: {authenticated: true}, id: @ticket_to_destroy_id)
    assert result.success?
    assert_nil Ticket.find_by_id(@ticket_to_destroy_id)
  end

  test 'unsuccessful destroy' do
    result = DestroyTicket.call(response: {}, id: @ticket_to_destroy_id)
    assert_not result.success?
    assert Ticket.find_by_id(@ticket_to_destroy_id)
  end
end