require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'admin creating user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'admin10@admin.admin', password: '1234567890'}}
  let(:sign_up_path) {'/admins/'}

  it 'can create admin' do
    create(:admin, email: user[:email], password: user[:password])
    operation_with_out_sign_up do
      header = response.header
      post '/admins/', params: {user: {email: 'admin9@admin.admin', password: '123456789', password_confirmation: '123456789'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :created
    end
  end

  it 'can create customer' do
    create(:admin, email: user[:email], password: user[:password])
    operation_with_out_sign_up do
      header = response.header
      post '/customers/', params: {user: {email: 'customer9@customer.customer', password: '123456789', password_confirmation: '123456789'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :created
    end
  end

  it 'can create agent' do
    create(:admin, email: user[:email], password: user[:password])
    operation_with_out_sign_up do
      header = response.header
      post '/agents/', params: {user: {email: 'agent9@agent.agent', password: '123456789', password_confirmation: '123456789'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :created
    end
  end
end