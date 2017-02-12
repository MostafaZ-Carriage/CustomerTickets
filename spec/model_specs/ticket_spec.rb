require 'rails_helper'
RSpec.describe Ticket, :type => :model do
  include ModelHelper
  let(:new_ticket) { Ticket.new }

  it 'Ticket class exists' do
    expect(class_exists?(Ticket)).to eq(true)
  end

  it ' has title' do
    expect(ticket_has_attribute?(:title)).to eq(true)
  end

  it ' has a default title' do
    expect(new_ticket.title).to eq(Ticket::DEFAULT_TITLE)
  end

  it ' has description' do
    expect(ticket_has_attribute?(:description)).to eq(true)
  end

  it ' has created_at' do
    expect(ticket_has_attribute?(:created_at)).to eq(true)
  end

  it ' has status' do
    expect(ticket_has_attribute?(:status)).to eq(true)
  end

  it ' has a default status' do
    expect(new_ticket.status).to eq(TicketStatus::OPEN)
  end

  it ' has updated_at' do
    expect(ticket_has_attribute?(:updated_at)).to eq(true)
  end

  it ' has creator_id' do
    expect(ticket_has_attribute?(:creator_id)).to eq(true)
  end

  it ' has closer_id' do
    expect(ticket_has_attribute?(:closer_id)).to eq(true)
  end

  it ' has creator' do
    expect(ticket_can_respond_to?(:creator)).to eq(true)
  end

  it ' has closer' do
    expect(ticket_can_respond_to?(:closer)).to eq(true)
  end

  it ' should has creator' do
    expect(new_ticket.valid?).to eq(true)
  end

  it ' should have closer when closed' do
    expect(build(:ticket_customer, status: TicketStatus::CLOSE).save).to_not eq(true)
  end

  it ' have closer should be closed automatically' do
    User.current_user = closer = create(:admin_creates_agent, creator: create(:admin))
    ticket = create(:ticket_customer, closer: closer, creator: create(:customer))
    expect(ticket.status).to eq(TicketStatus::CLOSE)
  end

  it ' has creator_type' do
    expect(ticket_has_attribute?(:creator_type)).to eq(true)
  end

  it ' has closer_type' do
    expect(ticket_has_attribute?(:closer_type)).to eq(true)
  end

  it ' has customer creator' do
    expect(build(:ticket_customer, creator: create(:customer)).save).to eq(true)
  end

  it ' has admin creator' do
    expect(build(:ticket_admin, creator: create(:admin)).save).to eq(true)
  end

  it ' can not has agent creator' do
    expect(build(:ticket_agent).save).to_not eq(true)
  end

  it ' can not has customer closer' do
    expect(build(:ticket_customer_close).save).to_not eq(true)
  end

  it ' has admin closer' do
    expect(build(:ticket_admin_close, creator: create(:customer)).save).to eq(true)
  end

  it ' has agent closer' do
    expect(build(:ticket_agent_close, creator: create(:customer)).save).to eq(true)
  end

  private

  def ticket_has_attribute?(attribute_name)
    obj_has_attribute?(new_ticket, attribute_name)
  end

  def ticket_can_respond_to?(method_name)
    obj_can_respond_to?(new_ticket, method_name)
  end

end