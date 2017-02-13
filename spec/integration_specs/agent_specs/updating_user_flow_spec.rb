require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'agent updating user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'agent10@agent.agent', password: '1234567890'}}
  let(:sign_up_path) {'/agents/'}

  it 'can NOT update admin' do
    admin = create(:admin)
    create(:agent, email: user[:email], password: user[:password], creator: admin)
    operation_with_out_sign_up do
      header = response.header
      put "/admins/#{admin.id}", params: {user: {email: 'admin119@admin.admin'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_modified
    end
  end

  it 'can NOT update customer' do
    create(:agent, email: user[:email], password: user[:password], creator: create(:admin))
    customer = create(:customer)
    operation_with_out_sign_up do
      header = response.header
      put "/customers/#{customer.id}", params: {user: {email: 'customer1119@customer.customer'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_modified
    end
  end

  it 'can NOT update agent' do
    admin = create(:admin)
    create(:agent, email: user[:email], password: user[:password], creator: admin)
    agent = create(:agent, creator: admin)
    operation_with_out_sign_up do
      header = response.header
      put "/agents/#{agent.id}", params: {user: {email: 'agent119@agent.agent'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :not_modified
    end
  end

  it 'can update self' do
    agent = create(:agent, email: user[:email], password: user[:password], creator: create(:admin))
    operation_with_out_sign_up do
      header = response.header
      put "/agents/#{agent.id}", params: {user: {email: 'agent119@agent.agent'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :accepted
    end
  end
end