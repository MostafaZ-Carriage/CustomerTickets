require 'test_helper'
class CreateAgentTest < ActiveSupport::TestCase

  teardown do
    Agent.destroy_all
  end

  test 'Create Agent interactor exists' do
    class_exists?(CreateAgent)
  end

  test 'successful create' do
    result = CreateAgent.call(response: {authenticated: true}, agent: build(:agent).as_json.merge(password: '12312321312'))
    assert result.success?
    assert result.response[:agent][:id]==Agent.last.id
  end

  test 'unsuccessful create' do
    result = CreateAgent.call(response: {authenticated: true}, agent: build(:agent).as_json)
    assert_not result.success?
    assert_nil result.response[:agent]
  end
end