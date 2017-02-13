require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'admin updating user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'admin10@admin.admin', password: '1234567890'}}
  let(:sign_up_path) {'/admins/'}

  it 'can update admin' do
    create(:admin, email: user[:email], password: user[:password])
    admin = create(:admin)
    operation_with_out_sign_up do
      header = response.header
      put "/admins/#{admin.id}", params: {user: {email: 'admin119@admin.admin'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :accepted
    end
  end

  it 'can update customer' do
    create(:admin, email: user[:email], password: user[:password])
    customer = create(:customer)
    operation_with_out_sign_up do
      header = response.header
      put "/customers/#{customer.id}", params: {user: {email: 'customer1119@customer.customer'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :accepted
    end
  end

  it 'can update agent' do
    admin = create(:admin, email: user[:email], password: user[:password])
    agent = create(:agent, creator: admin)
    operation_with_out_sign_up do
      header = response.header
      put "/agents/#{agent.id}", params: {user: {email: 'agent119@agent.agent'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :accepted
    end
  end
end