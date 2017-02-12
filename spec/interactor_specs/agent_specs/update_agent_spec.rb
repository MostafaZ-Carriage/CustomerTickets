require 'rails_helper'
RSpec.describe DestroyAgent do
  include ModelHelper

  let(:new_name) { 'New Name' }

  after do
    Agent.destroy_all
  end

  it 'Update Agent interactor exists' do
    expect(class_exists?(UpdateAgent)).to eq(true)
  end

  it 'successful update' do
    agent = create(:admin_creates_agent)
    result = UpdateAgent.call(response: {authenticated: true}, agent: agent.as_json.merge(name: new_name).symbolize_keys!, current_user: agent)
    expect(result.success?).to eq(true)
    expect(result.response[:agent][:name]).to eq(Agent.last.name)
  end

  it 'unsuccessful update' do
    agent_obj = create(:admin_creates_agent).as_json.symbolize_keys!
    agent_obj[:id] = -1
    result = UpdateAgent.call(response: {authenticated: true}, agent: agent_obj)
    expect(result.success?).to_not eq(true)
    expect(result.response[:agent]).to eq(nil)
  end
end