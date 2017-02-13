require 'rails_helper'
RSpec.describe FindAdmin do
  include ModelHelper

  it 'Find Admin interactor exists' do
    expect(class_exists?(FindAdmin)).to eq(true)
  end

  it 'successful find' do
    new_admin = create(:admin).as_json.symbolize_keys
    result = FindAdmin.call(response: {authenticated: true}, user: new_admin)
    expect(result.success?).to eq(true)
    expect(result.response[:admin][:id]).to eq(new_admin[:id])
  end

  it 'unsuccessful find' do
    result = FindAdmin.call(response: {authenticated: true}, user: {id: -1})
    expect(result.success?).to_not eq(true)
    expect(result.response[:admin]).to eq(nil)
  end
end