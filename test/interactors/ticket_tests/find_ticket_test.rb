require 'test_helper'
class FindTicketTest < ActiveSupport::TestCase

  test 'Find Ticket interactor exists' do
    class_exists?(FindTicket)
  end

  test 'successful find' do
    new_ticket_id = create(:ticket_customer).id
    result = FindTicket.call(response: {authenticated: true}, id: new_ticket_id)
    assert result.success?
    assert result.response[:ticket][:id]==new_ticket_id
  end

  test 'unsuccessful find' do
    result = FindTicket.call(response: {authenticated: true}, id: -1)
    assert_not result.success?
    assert_nil result.response[:ticket]
  end
end