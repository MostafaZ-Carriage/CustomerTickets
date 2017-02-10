require 'test_helper'
class TicketTest < ActiveSupport::TestCase

  setup do
    @new_ticket = Ticket.new
    @existing_ticket = tickets(:ticket1)
  end

  test 'Ticket class exists' do
    assert Ticket.is_a? Class
  end

  test 'A ticket has title' do
    assert @new_ticket.has_attribute?(:title)
  end

  test 'A ticket has a default title' do
    assert @new_ticket.title == Ticket::DEFAULT_TITLE
  end

  test 'A ticket has description' do
    assert @new_ticket.has_attribute?(:description)
  end

  test 'A ticket has created_at' do
    assert @new_ticket.has_attribute?(:created_at)
  end

  test 'A ticket has updated_at' do
    assert @new_ticket.has_attribute?(:updated_at)
  end
end