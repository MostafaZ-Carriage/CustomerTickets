require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'agent session flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'agent10@agent.agent', password: '1234567890'}}
  let(:sign_up_path) {'/agents/'}

  it 'agent can not sign up' do
    sign_up
    assert_response :unauthorized
  end

  it 'sign in' do
    agent = create(:agent, creator: create(:admin))
    sign_in({email: agent.email, password: agent.password})
    assert Agent.find_by_id(response_json['data']['id'])
    assert_response :success
  end

  it 'sign out' do
    agent = create(:agent, creator: create(:admin))
    sign_in({email: agent.email, password: agent.password})
    sign_out
    assert_response :success
  end
end