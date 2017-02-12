require 'rails_helper'
RSpec.describe DestroyAgent do
  include ModelHelper

  let(:agent_to_destroy_id) { create(:admin_creates_agent).id }

  after do
    Agent.destroy_all
  end

  it 'Destroy Agent interactor exists' do
    expect(class_exists?(DestroyAgent)).to eq(true)
  end

  it 'successful destroy' do
    result = DestroyAgent.call(response: {authenticated: true}, id: agent_to_destroy_id)
    expect(result.success?).to eq(true)
    expect(Agent.find_by_id(agent_to_destroy_id)).to eq(nil)
  end

  it 'unsuccessful destroy' do
    result = DestroyAgent.call(response: {}, id: agent_to_destroy_id)
    expect(result.success?).to_not eq(true)
    expect(Agent.find_by_id(agent_to_destroy_id).present?).to eq(true)
  end
end