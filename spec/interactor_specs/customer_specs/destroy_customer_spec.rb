require 'rails_helper'
RSpec.describe DestroyCustomer do
  include ModelHelper

  let(:customer_to_destroy) { create(:customer).as_json.symbolize_keys }

  after do
    Customer.destroy_all
  end

  it 'Destroy Customer interactor exists' do
    expect(class_exists?(DestroyCustomer)).to eq(true)
  end

  it 'successful destroy' do
    result = DestroyCustomer.call(response: {authenticated: true}, customer: customer_to_destroy, current_user: Admin.first)
    expect(result.success?).to eq(true)
    expect(Customer.find_by_id(customer_to_destroy[:id])).to eq(nil)
  end

  it 'unsuccessful destroy' do
    result = DestroyCustomer.call(response: {}, customer: customer_to_destroy, current_user: Admin.first)
    expect(result.success?).to_not eq(true)
    expect(Customer.find_by_id(customer_to_destroy[:id]).present?).to eq(true)
  end
end