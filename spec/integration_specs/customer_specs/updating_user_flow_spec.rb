require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'customer updating user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'customer10@customer.customer', password: '1234567890'}}
  let(:sign_up_path) {'/customers/'}

  it 'can NOT update admin' do
    admin = create(:admin)
    operation do
      header = response.header
      put "/admins/#{admin.id}", params: {user: {email: 'admin119@admin.admin'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_modified
    end
  end

  it 'can NOT update customer' do
    customer = create(:customer)
    operation do
      header = response.header
      put "/customers/#{customer.id}", params: {user: {email: 'customer1119@customer.customer'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_modified
    end
  end

  it 'can NOT update agent' do
    agent = create(:agent, creator: create(:admin))
    operation do
      header = response.header
      put "/agents/#{agent.id}", params: {user: {email: 'agent119@agent.agent'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_modified
    end
  end

  it 'can update self' do
    operation do
      header = response.header
      put "/agents/#{response_json[:id]}", params: {user: {email: 'agent119@agent.agent'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :accepted
    end
  end
end