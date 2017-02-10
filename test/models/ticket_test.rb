require 'test_helper'
class TicketTest < ActiveSupport::TestCase
  test 'Ticket class exists' do
    assert Ticket.is_a? Class
  end
end