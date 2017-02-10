require 'test_helper'
class AgentTest < ActiveSupport::TestCase

  setup do
    @new_agent = Agent.new
  end

  test 'Agent class exists' do
    assert class_exists?(Agent)
  end

  test 'Type should equal to Agent' do
    assert @new_agent.type == 'Agent'
  end

  test 'Agent has tickets' do
    assert user_can_respond_to?(:closed_tickets)
  end

  test 'Agent can access his tickets'do
    agent = create(:agent_with_tickets)
    assert agent.closed_tickets==Ticket.where(closer: agent)
  end

  private

  def user_can_respond_to?(method_name)
    obj_can_respond_to?(@new_agent, method_name)
  end
end