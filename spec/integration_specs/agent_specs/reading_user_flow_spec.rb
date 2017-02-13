require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'agent reading user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'agent10@agent.agent', password: '1234567890'}}
  let(:sign_up_path) {'/agents/'}
  let(:admin){create(:admin)}
  let(:agent){create(:agent, creator: admin)}
  let(:customer){create(:customer)}

  it 'can read admin' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    operation_with_out_sign_up do
      header = response.header
      get "/admins/#{admin.id}", params: {user: {id: admin.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['admin']['id']).to eq(admin.id)
    end
  end

  it 'can read paged customers' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    operation_with_out_sign_up do
      header = response.header
      get "/customers/#{customer.id}", params: {user:{id: customer.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['customer']['id']).to eq(customer.id)
    end
  end

  it 'can read paged agents' do
    create(:agent, email: user[:email], password: user[:password], creator: Admin.first)
    operation_with_out_sign_up do
      header = response.header
      get "/agents/#{agent.id}", params: {user: {id: agent.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['agent']['id']).to eq(agent.id)
    end
  end
end