require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'customer destroying user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'customer10@customer.customer', password: '1234567890'}}
  let(:sign_up_path) {'/customers/'}

  it 'can NOT destroy admin' do
    admin = create(:admin)
    operation do
      header = response.header
      delete "/admins/#{admin.id}", params: {user: {id: admin.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :no_content
    end
  end

  it 'can NOT destroy customer' do
    customer = create(:customer)
    operation do
      header = response.header
      delete "/customers/#{customer.id}", params: {user: {id: customer.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :no_content
    end
  end

  it 'can NOT destroy agent' do
    agent = create(:agent, creator: create(:admin))
    operation do
      header = response.header
      delete "/agents/#{agent.id}", params: {user: {id: agent.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :no_content
    end
  end

  it 'can destroy self' do
    operation do
      header = response.header
      delete "/customers/#{response_json['data']['id']}", params: {user: {id: response_json[:id]}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
    end
  end
end