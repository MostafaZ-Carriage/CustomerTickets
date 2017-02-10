require 'test_helper'
class TicketTest < ActiveSupport::TestCase

  setup do
    @new_ticket = Ticket.new
  end

  test 'Ticket class exists' do
    assert class_exists?(Ticket)
  end

  test 'A ticket has title' do
    assert ticket_has_attribute?(:title)
  end

  test 'A ticket has a default title' do
    assert @new_ticket.title == Ticket::DEFAULT_TITLE
  end

  test 'A ticket has description' do
    assert ticket_has_attribute?(:description)
  end

  test 'A ticket has created_at' do
    assert ticket_has_attribute?(:created_at)
  end

  test 'A ticket has updated_at' do
    assert ticket_has_attribute?(:updated_at)
  end

  private

  def ticket_has_attribute?(attribute_name)
    obj_has_attribute?(@new_ticket, attribute_name)
  end
end