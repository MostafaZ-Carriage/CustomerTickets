require 'rails_helper'
RSpec.describe DestroyCustomer do
  include ModelHelper

  let(:customer_to_destroy_id) { create(:customer).id }

  after do
    Customer.destroy_all
  end

  it 'Destroy Customer interactor exists' do
    expect(class_exists?(DestroyCustomer)).to eq(true)
  end

  it 'successful destroy' do
    result = DestroyCustomer.call(response: {authenticated: true}, id: customer_to_destroy_id)
    expect(result.success?).to eq(true)
    expect(Customer.find_by_id(customer_to_destroy_id)).to eq(nil)
  end

  it 'unsuccessful destroy' do
    result = DestroyCustomer.call(response: {}, id: customer_to_destroy_id)
    expect(result.success?).to_not eq(true)
    expect(Customer.find_by_id(customer_to_destroy_id).present?).to eq(true)
  end
end