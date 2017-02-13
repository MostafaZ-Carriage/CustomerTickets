require 'rails_helper'
RSpec.describe DestroyAgent do
  include ModelHelper

  let(:agent_to_destroy) { create(:admin_creates_agent).as_json.symbolize_keys }

  after do
    Agent.destroy_all
  end

  it 'Destroy Agent interactor exists' do
    expect(class_exists?(DestroyAgent)).to eq(true)
  end

  it 'successful destroy' do
    result = DestroyAgent.call(response: {authenticated: true}, agent: agent_to_destroy, current_user: create(:admin))
    expect(result.success?).to eq(true)
    expect(Agent.find_by_id(agent_to_destroy[:id])).to eq(nil)
  end

  it 'unsuccessful destroy' do
    result = DestroyAgent.call(response: {}, agent: agent_to_destroy, current_user: create(:admin))
    expect(result.success?).to_not eq(true)
    expect(Agent.find_by_id(agent_to_destroy[:id]).present?).to eq(true)
  end
end