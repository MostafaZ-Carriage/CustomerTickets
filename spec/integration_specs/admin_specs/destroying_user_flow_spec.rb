require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'admin destroying user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'admin10@admin.admin', password: '1234567890'}}
  let(:sign_up_path) {'/admins/'}

  it 'can destroy admin' do
    create(:admin, email: user[:email], password: user[:password])
    admin = create(:admin)
    operation_with_out_sign_up do
      header = response.header
      delete "/admins/#{admin.id}", params: {user: {id: admin.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
    end
  end

  it 'can destroy customer' do
    create(:admin, email: user[:email], password: user[:password])
    customer = create(:customer)
    operation_with_out_sign_up do
      header = response.header
      delete "/customers/#{customer.id}", params: {user: {id: customer.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
    end
  end

  it 'can destroy agent' do
    admin = create(:admin, email: user[:email], password: user[:password])
    agent = create(:agent, creator: admin)
    operation_with_out_sign_up do
      header = response.header
      delete "/agents/#{agent.id}", params: {user: {id: agent.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :ok
    end
  end
end