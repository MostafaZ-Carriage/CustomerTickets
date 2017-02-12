# require 'test_helper'
# class AgentTest < ActiveSupport::TestCase
#
#   setup do
#     @new_agent = Agent.new
#   end
#
#   test 'Agent class exists' do
#     assert class_exists?(Agent)
#   end
#
#   test 'Type should equal to Agent' do
#     assert @new_agent.type == 'Agent'
#   end
#
#   test 'Agent has tickets' do
#     assert user_can_respond_to?(:closed_tickets)
#   end
#
#   test 'Agent can access his tickets'do
#     agent = create(:agent_with_tickets, creator: create(:admin))
#     assert agent.closed_tickets==Ticket.where(closer: agent)
#   end
#
#   test 'An Agent can not has customer creator' do
#     assert_not build(:customer_creates_agent).save
#   end
#
#   test 'An Agent has admin creator' do
#     assert build(:admin_creates_agent, creator: create(:admin)).save
#   end
#
#   test 'An Agent can not has agent creator' do
#     assert_not build(:agent_creates_agent).save
#   end
#
#   test 'An Agent can not has non user creator' do
#     assert_not build(:non_user_creates_agent).save
#   end
#
#   private
#
#   def user_can_respond_to?(method_name)
#     obj_can_respond_to?(@new_agent, method_name)
#   end
# end