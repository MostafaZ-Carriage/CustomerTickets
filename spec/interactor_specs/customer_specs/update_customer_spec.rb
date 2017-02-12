require 'rails_helper'
RSpec.describe DestroyCustomer do
  include ModelHelper

  let(:new_name) { 'New Name' }

  after do
    Customer.destroy_all
  end

  it 'Update Customer interactor exists' do
    expect(class_exists?(UpdateCustomer)).to eq(true)
  end

  it 'successful update' do
    customer = create(:customer)
    result = UpdateCustomer.call(response: {authenticated: true}, customer: customer.as_json.merge(name: @new_name).symbolize_keys!, current_user: customer)
    expect(result.success?).to eq(true)
    expect(result.response[:customer][:name]).to eq(Customer.last.name)
  end

  it 'unsuccessful update' do
    customer_obj = create(:customer).as_json.symbolize_keys!
    customer_obj[:id] = -1
    result = UpdateCustomer.call(response: {authenticated: true}, customer: customer_obj)
    expect(result.success?).to_not eq(true)
    expect(result.response[:customer]).to eq(nil)
  end
end