require 'rails_helper'
RSpec.describe FindAdmin do
  include ModelHelper

  it 'Find Admin interactor exists' do
    expect(class_exists?(FindAdmin)).to eq(true)
  end

  it 'successful find' do
    new_admin_id = create(:admin).id
    result = FindAdmin.call(response: {authenticated: true}, id: new_admin_id)
    expect(result.success?).to eq(true)
    expect(result.response[:admin][:id]).to eq(new_admin_id)
  end

  it 'unsuccessful find' do
    result = FindAdmin.call(response: {authenticated: true}, id: -1)
    expect(result.success?).to_not eq(true)
    expect(result.response[:admin]).to eq(nil)
  end
end