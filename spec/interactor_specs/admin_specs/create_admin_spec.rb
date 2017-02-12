require 'rails_helper'
RSpec.describe CreateAdmin do
  include ModelHelper

  after do
    Admin.destroy_all
  end

  it 'Create Admin interactor exists' do
    expect(class_exists?(CreateAdmin)).to eq(true)
  end

  it 'successful create' do
    result = CreateAdmin.call(response: {authenticated: true}, admin: build(:admin).as_json.merge(password: '12312321312'))
    expect(result.success?).to eq(true)
    expect(result.response[:admin][:id]).to eq(Admin.last.id)
  end

  it 'unsuccessful create' do
    result = CreateAdmin.call(response: {authenticated: true}, admin: build(:admin).as_json)
    expect(result.success?).to_not eq(true)
    expect(result.response[:admin]).to eq(nil)
  end
end