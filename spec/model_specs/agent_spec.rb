require 'rails_helper'
RSpec.describe Agent, :type => :model do
  include ModelHelper

  let(:new_agent) { Agent.new }

  it 'Agent class exists' do
    expect(class_exists?(Agent)).to eq(true)
  end

  it 'Type should equal to Agent' do
    expect(new_agent.type).to eq('Agent')
  end

  it 'has tickets' do
    expect(user_can_respond_to?(:closed_tickets)).to eq(true)
  end

  it 'can access his tickets'do
    agent = create(:agent_with_tickets, creator: create(:admin))
    expect(agent.closed_tickets).to eq(Ticket.where(closer: agent))
  end

  it ' can not has customer creator' do
    expect(build(:customer_creates_agent).save).to_not eq(true)
  end

  it ' has admin creator' do
    expect(build(:admin_creates_agent, creator: create(:admin)).save).to eq(true)
  end

  it ' can not has agent creator' do
    expect(build(:agent_creates_agent).save).to_not eq(true)
  end

  it ' can not has non user creator' do
    expect(build(:non_user_creates_agent).save).to_not eq(true)
  end

  private

  def user_can_respond_to?(method_name)
    obj_can_respond_to?(new_agent, method_name)
  end
end