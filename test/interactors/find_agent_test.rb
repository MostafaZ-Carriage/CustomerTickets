require 'test_helper'
class FindAgentTest < ActiveSupport::TestCase

  test 'Find Agent interactor exists' do
    class_exists?(FindAgent)
  end

  test 'successful find' do
    new_agent_id = create(:agent).id
    result = FindAgent.call(response: {authenticated: true}, id: new_agent_id)
    assert result.success?
    assert result.response[:agent][:id]==new_agent_id
  end

  test 'unsuccessful find' do
    result = FindAgent.call(response: {authenticated: true}, id: -1)
    assert_not result.success?
    assert_nil result.response[:agent]
  end
end