require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'customer reading user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'customer10@customer.customer', password: '1234567890'}}
  let(:sign_up_path) {'/customers/'}
  let(:admin){create(:admin)}
  let(:agent){create(:agent, creator: admin)}
  let(:customer){create(:customer)}

  it 'can read admin' do
    operation do
      header = response.header
      get "/admins/#{admin.id}", params: {user: {id: admin.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['admin']['id']).to eq(admin.id)
    end
  end

  it 'can read paged customers' do
    operation do
      header = response.header
      get "/customers/#{customer.id}", params: {user:{id: customer.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['customer']['id']).to eq(customer.id)
    end
  end

  it 'can read paged agents' do
    operation do
      header = response.header
      get "/agents/#{agent.id}", params: {user: {id: agent.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
      expect(response_json['agent']['id']).to eq(agent.id)
    end
  end
end