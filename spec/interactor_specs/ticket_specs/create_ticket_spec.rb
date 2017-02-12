require 'rails_helper'
RSpec.describe CreateTicket do
  include ModelHelper

  after do
    Ticket.destroy_all
  end

  it 'Create Customer interactor exists' do
    expect(class_exists?(CreateTicket)).to eq(true)
  end

  it 'customer successfully create' do
    result = CreateTicket.call(response: {authenticated: true}, ticket: build(:ticket).as_json, current_user: create(:customer))
    expect(result.success?).to eq(true)
    expect(result.response[:ticket][:id]).to eq(Ticket.last.id)
  end

  it 'admin successfully create' do
    result = CreateTicket.call(response: {authenticated: true}, ticket: build(:ticket).as_json, current_user: create(:admin))
    expect(result.success?).to eq(true)
    expect(result.response[:ticket][:id]).to eq(Ticket.last.id)
  end

  it 'agent unsuccessfully create' do
    result = CreateTicket.call(response: {authenticated: true}, ticket: build(:ticket).as_json, current_user: create(:admin_creates_agent))
    expect(result.success?).to_not eq(true)
    expect(result.response[:ticket]).to eq(nil)
  end

  it 'unsuccessfully create' do
    result = CreateTicket.call(response: {authenticated: true}, ticket: build(:ticket).as_json)
    expect(result.success?).to_not eq(true)
    expect(result.response[:ticket]).to eq(nil)
  end
end