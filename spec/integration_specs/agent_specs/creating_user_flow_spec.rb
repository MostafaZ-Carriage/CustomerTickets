require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'agent session flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'agent10@agent.agent', password: '1234567890'}}
  let(:sign_up_path) {'/agents/'}

  it 'can NOT create agent' do
    create(:agent, email: user[:email], password: user[:password], creator: create(:admin))
    operation_with_out_sign_up do
      header = response.header
      post '/agents/', params: {user: {email: 'agent9@agent.agent', password: '123456789', password_confirmation: '123456789'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_acceptable
    end
  end

  it 'can NOT create admin' do
    create(:agent, email: user[:email], password: user[:password], creator: create(:admin))
    operation_with_out_sign_up do
      header = response.header
      post '/admins/', params: {user: {email: 'admin9@admin.admin', password: '123456789', password_confirmation: '123456789'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_acceptable
    end
  end

  it 'can NOT create customer' do
    create(:agent, email: user[:email], password: user[:password], creator: create(:admin))
    operation_with_out_sign_up do
      header = response.header
      post '/customers/', params: {user: {email: 'customer9@customer.customer', password: '123456789', password_confirmation: '123456789'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_acceptable
    end
  end
end