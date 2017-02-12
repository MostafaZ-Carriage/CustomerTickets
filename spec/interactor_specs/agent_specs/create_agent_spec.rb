require 'rails_helper'
RSpec.describe CreateAgent do
  include ModelHelper

  after do
    Agent.destroy_all
  end

  it 'Create Agent interactor exists' do
    expect(class_exists?(CreateAgent)).to eq(true)
  end

  it 'successful create' do
    result = CreateAgent.call(response: {authenticated: true}, agent: build(:admin_creates_agent).as_json.merge(password: '12312321312'))
    expect(result.success?).to eq(true)
    expect(result.response[:agent][:id]).to eq(Agent.last.id)
  end

  it 'unsuccessful create' do
    result = CreateAgent.call(response: {authenticated: true}, agent: build(:admin_creates_agent).as_json)
    expect(result.success?).to_not eq(true)
    expect(result.response[:agent]).to eq(nil)
  end
end