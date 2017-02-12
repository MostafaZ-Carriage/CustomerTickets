require 'rails_helper'
RSpec.describe GetAdminPage do
  include ModelHelper

  before do
    (0...BULK_CREATE_SIZE).each { |i| create(:admin, email: "xxxx#{i}@xxx.xxx") }
  end

  it 'Find Admin interactor exists' do
    expect(class_exists?(GetAdminPage)).to eq(true)
  end

  it 'send page' do
    result = GetAdminPage.call(response: {authenticated: true}, page: 1, per_page: BULK_CREATE_SIZE-1)
    expect(result.success?).to eq(true)
    expect(result.response[:admins].size).to eq(BULK_CREATE_SIZE-1)
  end

  it 'Do not send page' do
    result = GetAdminPage.call(response: {authenticated: true})
    expect(result.success?).to eq(true)
    expect(result.response[:admins].size).to eq(BULK_CREATE_SIZE+1)
  end
end