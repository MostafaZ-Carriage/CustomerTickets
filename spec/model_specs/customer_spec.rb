require 'rails_helper'
RSpec.describe Customer, :type => :model do
  include ModelHelper
  let(:new_customer) { Customer.new }

  it 'Customer class exists' do
    expect(class_exists?(Customer)).to eq(true)
  end

  it 'Type should equal to Customer' do
    expect(new_customer.type).to eq('Customer')
  end

  it ' has tickets' do
    expect(user_can_respond_to?(:created_tickets)).to eq(true)
  end

  it ' can access his tickets'do
    customer = create(:customer_with_tickets, creator: create(:admin))
    expect(customer.created_tickets).to eq(Ticket.where(creator: customer))
  end

  it ' can not has customer creator' do
    expect(build(:customer_creates_customer).save).to_not eq(true)
  end

  it ' has admin creator' do
    expect(build(:admin_creates_customer, creator: create(:admin)).save).to eq(true)
  end

  it ' can not has agent creator' do
    expect(build(:agent_creates_customer, creator: create(:admin_creates_agent, creator: create(:admin))).save).to_not eq(true)
  end

  it ' can not has non user creator' do
    expect(build(:customer).save).to eq(true)
  end

  private

  def user_can_respond_to?(method_name)
    obj_can_respond_to?(new_customer, method_name)
  end
end