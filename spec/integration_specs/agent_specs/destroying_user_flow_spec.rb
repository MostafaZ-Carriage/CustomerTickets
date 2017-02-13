require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'agent destroying user flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'agent10@agent.agent', password: '1234567890'}}
  let(:sign_up_path) {'/agents/'}

  it 'can NOT destroy admin' do
    admin = create(:admin)
    create(:agent, email: user[:email], password: user[:password], creator: admin)
    operation_with_out_sign_up do
      header = response.header
      delete "/admins/#{admin.id}", params: {user: {id: admin.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :no_content
    end
  end

  it 'can NOT destroy customer' do
    create(:agent, email: user[:email], password: user[:password], creator: create(:admin))
    customer = create(:customer)
    operation_with_out_sign_up do
      header = response.header
      delete "/customers/#{customer.id}", params: {user: {id: customer.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :no_content
    end
  end

  it 'can NOT destroy agent' do
    admin = create(:admin)
    create(:agent, email: user[:email], password: user[:password], creator: admin)
    agent = create(:agent, creator: admin)
    operation_with_out_sign_up do
      header = response.header
      delete "/agents/#{agent.id}", params: {user: {id: agent.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :no_content
    end
  end

  it 'can NOT destroy self' do
    agent = create(:agent, email: user[:email], password: user[:password], creator: create(:admin))
    operation_with_out_sign_up do
      header = response.header
      delete "/agents/#{agent.id}", params: {user: {id: agent.id}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :no_content
    end
  end
end