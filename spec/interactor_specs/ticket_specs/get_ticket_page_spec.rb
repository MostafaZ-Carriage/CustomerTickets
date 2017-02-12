require 'rails_helper'
RSpec.describe GetTicketPage do
  include ModelHelper

  before do
    (0...BULK_CREATE_SIZE).each { |i| create(:ticket_customer, creator: create(:customer, email: "xxxx#{i}@xxx.xxx"))}
  end

  it 'Find Ticket interactor exists' do
    expect(class_exists?(GetTicketPage)).to eq(true)
  end

  it 'send page' do
    result = GetTicketPage.call(response: {authenticated: true}, page: 1, per_page: BULK_CREATE_SIZE-1)
    expect(result.success?).to eq(true)
    expect(result.response[:tickets].size).to eq(BULK_CREATE_SIZE-1)
  end

  it 'Do not send page' do
    result = GetTicketPage.call(response: {authenticated: true})
    expect(result.success?).to eq(true)
    expect(result.response[:tickets].size).to eq(BULK_CREATE_SIZE)
  end
end