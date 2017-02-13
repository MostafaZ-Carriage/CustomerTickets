require 'rails_helper'
RSpec.describe FindAgent do
  include ModelHelper

  it 'Find Agent interactor exists' do
    expect(class_exists?(FindAgent)).to eq(true)
  end

  it 'successful find' do
    new_agent = create(:admin_creates_agent).as_json.symbolize_keys
    result = FindAgent.call(response: {authenticated: true}, user: new_agent)
    expect(result.success?).to eq(true)
    expect(result.response[:agent][:id]).to eq(new_agent[:id])
  end

  it 'unsuccessful find' do
    result = FindAgent.call(response: {authenticated: true}, user: {id: -1})
    expect(result.success?).to_not eq(true)
    expect(result.response[:agent]).to eq(nil)
  end
end