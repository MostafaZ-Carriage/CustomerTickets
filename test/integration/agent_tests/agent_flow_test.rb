require 'test_helper'
require 'integration/abstract_flow'
class AgentFlowTest < ActionDispatch::IntegrationTest
  include AbstractFlow
  setup do
    @user = {email: 'agent10@agent.agent', password: '1234567890'}
    @sign_up_path = '/agents/'
  end
end