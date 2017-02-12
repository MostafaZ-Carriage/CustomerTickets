require 'rails_helper'
RSpec.describe DestroyTicket do
  include ModelHelper

  let(:existing_ticket) { create(:ticket_customer).as_json.symbolize_keys!.merge(title: 'New Name') }

  after do
    Ticket.destroy_all
  end

  it 'Update Ticket interactor exists' do
    expect(class_exists?(UpdateTicket)).to eq(true)
  end

  it 'successful update' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: existing_ticket, current_user: create(:admin_creates_agent))
    expect(result.success?).to eq(true)
    expect(result.response[:ticket][:title]).to eq(Ticket.last.title)
  end

  it 'unsuccessful update' do
    result = UpdateTicket.call(response: {}, ticket: existing_ticket, current_user: create(:admin_creates_agent))
    expect(result.success?).to_not eq(true)
    expect(result.response[:ticket]).to eq(nil)
  end

  it 'agent successfully close ticket' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: close_ticket!, current_user: create(:admin_creates_agent))
    expect(result.success?).to eq(true)
    expect(result.response[:ticket][:title]).to eq(Ticket.last.title)
  end

  it 'admin successfully close ticket' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: close_ticket!, current_user: create(:admin))
    expect(result.success?).to eq(true)
    expect(result.response[:ticket][:title]).to eq(Ticket.last.title)
  end

  it 'customer unsuccessful close ticket' do
    result = UpdateTicket.call(response: {authenticated: true}, ticket: close_ticket!, current_user: create(:customer, email: 'cosutmer2@costumer.customer'))
    expect(result.success?).to_not eq(true)
    expect(result.response[:ticket]).to eq(nil)
  end

  private

  def close_ticket!
    existing_ticket[:status] = TicketStatus::CLOSE
    existing_ticket
  end
end