require 'test_helper'
class DestroyAgentTest < ActiveSupport::TestCase

  setup do
    @agent_to_destroy_id = create(:admin_creates_agent).id
  end

  teardown do
    Agent.destroy_all
  end

  test 'Destroy Agent interactor exists' do
    class_exists?(DestroyAgent)
  end

  test 'successful destroy' do
    result = DestroyAgent.call(response: {authenticated: true}, id: @agent_to_destroy_id)
    assert result.success?
    assert_nil Agent.find_by_id(@agent_to_destroy_id)
  end

  test 'unsuccessful destroy' do
    result = DestroyAgent.call(response: {}, id: @agent_to_destroy_id)
    assert_not result.success?
    assert Agent.find_by_id(@agent_to_destroy_id)
  end
end