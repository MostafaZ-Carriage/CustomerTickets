require 'rails_helper'
RSpec.describe DestroyTicket do
  include ModelHelper

  let(:ticket_to_destroy) { create(:ticket_customer).as_json.symbolize_keys }

  after do
    Ticket.destroy_all
  end

  it 'Destroy Ticket interactor exists' do
    expect(class_exists?(DestroyTicket)).to eq(true)
  end

  it 'successful destroy' do
    result = DestroyTicket.call(response: {authenticated: true}, ticket: ticket_to_destroy, current_user: Admin.first)
    expect(result.success?).to eq(true)
    expect(Ticket.find_by_id(ticket_to_destroy[:id])).to eq(nil)
  end

  it 'unsuccessful destroy' do
    result = DestroyTicket.call(response: {}, ticket: ticket_to_destroy, current_user: Admin.first)
    expect(result.success?).to_not eq(true)
    expect(Ticket.find_by_id(ticket_to_destroy[:id]).present?).to eq(true)
  end
end