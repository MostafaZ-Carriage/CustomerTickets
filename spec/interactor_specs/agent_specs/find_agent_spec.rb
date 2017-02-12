require 'rails_helper'
RSpec.describe FindAgent do
  include ModelHelper

  it 'Find Agent interactor exists' do
    expect(class_exists?(FindAgent)).to eq(true)
  end

  it 'successful find' do
    new_agent_id = create(:admin_creates_agent).id
    result = FindAgent.call(response: {authenticated: true}, id: new_agent_id)
    expect(result.success?).to eq(true)
    expect(result.response[:agent][:id]).to eq(new_agent_id)
  end

  it 'unsuccessful find' do
    result = FindAgent.call(response: {authenticated: true}, id: -1)
    expect(result.success?).to_not eq(true)
    expect(result.response[:agent]).to eq(nil)
  end
end