require 'rails_helper'
RSpec.describe FindCustomer do
  include ModelHelper

  it 'Find Customer interactor exists' do
    expect(class_exists?(FindCustomer)).to eq(true)
  end

  it 'successful find' do
    new_customer_id = create(:customer).id
    result = FindCustomer.call(response: {authenticated: true}, id: new_customer_id)
    expect(result.success?).to eq(true)
    expect(result.response[:customer][:id]).to eq(new_customer_id)
  end

  it 'unsuccessful find' do
    result = FindCustomer.call(response: {authenticated: true}, id: -1)
    expect(result.success?).to_not eq(true)
    expect(result.response[:customer]).to eq(nil)
  end
end