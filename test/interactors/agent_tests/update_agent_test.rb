# require 'test_helper'
# class UpdateAgentTest < ActiveSupport::TestCase
#
#   setup do
#     @new_name = 'New Name'
#   end
#
#   teardown do
#     Agent.destroy_all
#   end
#
#   test 'Update Agent interactor exists' do
#     class_exists?(UpdateAgent)
#   end
#
#   test 'successful update' do
#     agent = create(:admin_creates_agent)
#     result = UpdateAgent.call(response: {authenticated: true}, agent: agent.as_json.merge(name: @new_name).symbolize_keys!, current_user: agent)
#     assert result.success?
#     assert result.response[:agent][:name]==Agent.last.name
#   end
#
#   test 'unsuccessful update' do
#     agent_obj = create(:admin_creates_agent).as_json.symbolize_keys!
#     agent_obj[:id] = -1
#     result = UpdateAgent.call(response: {authenticated: true}, agent: agent_obj)
#     assert_not result.success?
#     assert_nil result.response[:agent]
#   end
# end