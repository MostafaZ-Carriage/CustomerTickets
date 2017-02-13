require 'rails_helper'
RSpec.describe FindCustomer do
  include ModelHelper

  it 'Find Customer interactor exists' do
    expect(class_exists?(FindCustomer)).to eq(true)
  end

  it 'successful find' do
    new_customer = create(:customer).as_json.symbolize_keys
    result = FindCustomer.call(response: {authenticated: true}, user: new_customer)
    expect(result.success?).to eq(true)
    expect(result.response[:customer][:id]).to eq(new_customer[:id])
  end

  it 'unsuccessful find' do
    result = FindCustomer.call(response: {authenticated: true}, user: {id: -1})
    expect(result.success?).to_not eq(true)
    expect(result.response[:customer]).to eq(nil)
  end
end