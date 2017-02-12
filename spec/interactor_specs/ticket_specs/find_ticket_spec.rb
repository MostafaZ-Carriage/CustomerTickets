require 'rails_helper'
RSpec.describe FindTicket do
  include ModelHelper

  it 'Find Ticket interactor exists' do
    expect(class_exists?(FindTicket)).to eq(true)
  end

  it 'successful find' do
    new_ticket_id = create(:ticket_customer).id
    result = FindTicket.call(response: {authenticated: true}, id: new_ticket_id)
    expect(result.success?).to eq(true)
    expect(result.response[:ticket][:id]).to eq(new_ticket_id)
  end

  it 'unsuccessful find' do
    result = FindTicket.call(response: {authenticated: true}, id: -1)
    expect(result.success?).to_not eq(true)
    expect(result.response[:ticket]).to eq(nil)
  end
end