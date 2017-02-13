require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'agent managing ticket flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'agent10@agent.agent', password: '1234567890'}}
  let(:sign_up_path) {'/agents/'}
  before do
    (0...BULK_CREATE_SIZE).each { |i| create(:ticket_customer, creator: create(:customer, email: "xxxx#{i}@xxx.xxx"))}
    (0...BULK_CREATE_SIZE).each { |i| create(:ticket_customer, creator: create(:customer, email: "xxxx2#{i}@xxx.xxx"), status: TicketStatus::CLOSE, closer: Admin.first)}
  end

  it 'can read paged tickets' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    operation_with_out_sign_up do
      header = response.header
      get '/tickets/', params: {page: 1, per_page: BULK_CREATE_SIZE-1}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['tickets'].size).to eq(BULK_CREATE_SIZE-1)
    end
  end

  it 'can read ticket' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    ticket = Ticket.first
    operation_with_out_sign_up do
      header = response.header
      get "/tickets/#{ticket.id}", params: {ticket: {id: ticket.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['ticket']['id']).to eq(ticket.id)
    end
  end

  it 'can NOT create an open ticket' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    operation_with_out_sign_up do
      header = response.header
      post '/tickets/', params: {ticket: {status: TicketStatus::OPEN}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_acceptable
    end
  end

  it 'can NOT create a closed ticket' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    operation_with_out_sign_up do
      header = response.header
      post '/tickets/', params: {ticket: {status: TicketStatus::CLOSE}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_acceptable
    end
  end

  it 'can open a closed ticket' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    ticket = Ticket.where(status: TicketStatus::CLOSE).first
    operation_with_out_sign_up do
      header = response.header
      put "/tickets/#{ticket.id}", params: {ticket: {status: TicketStatus::OPEN}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :accepted
    end
  end

  it 'can close an opened ticket' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    ticket = Ticket.where(status: TicketStatus::OPEN).first
    operation_with_out_sign_up do
      header = response.header
      put "/tickets/#{ticket.id}", params: {ticket: {status: TicketStatus::CLOSE}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :accepted
    end
  end

  it 'can NOT destroy ticket' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    ticket = Ticket.first
    operation_with_out_sign_up do
      header = response.header
      delete "/tickets/#{ticket.id}", params: {ticket: {id: ticket.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :no_content
    end
  end
end