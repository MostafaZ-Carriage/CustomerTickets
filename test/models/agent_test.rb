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

  private

  def user_has_attribute?(attribute_name)
    obj_has_attribute?(@new_agent, attribute_name)
  end
end