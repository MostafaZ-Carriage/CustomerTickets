require 'rails_helper'
RSpec.describe GetAgentPage do
  include ModelHelper

  before do
    (0...BULK_CREATE_SIZE).each { |i| create(:admin_creates_agent, email: "xxxx#{i}@xxx.xxx") }
  end

  it 'Find Agent interactor exists' do
    expect(class_exists?(GetAgentPage)).to eq(true)
  end

  it 'send page' do
    result = GetAgentPage.call(response: {authenticated: true}, page: 1, per_page: BULK_CREATE_SIZE-1)
    expect(result.success?).to eq(true)
    expect(result.response[:agents].size).to eq(BULK_CREATE_SIZE-1)
  end

  it 'Do not send page' do
    result = GetAgentPage.call(response: {authenticated: true})
    expect(result.success?).to eq(true)
    expect(result.response[:agents].size).to eq(BULK_CREATE_SIZE)
  end
end