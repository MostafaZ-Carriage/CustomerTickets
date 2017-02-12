require 'rails_helper'
RSpec.describe Admin, :type => :model do
  include ModelHelper
  let(:new_admin) { Admin.new }

  it 'Admin class exists' do
    expect(class_exists?(Admin)).to eq(true)
  end

  it 'Type should equal to Admin' do
    expect(new_admin.type).to eq('Admin')
  end
  it 'Type should equal to Admin' do
    expect(new_admin.type).to eq('Admin')
  end

  it 'has open tickets' do
    expect(user_can_respond_to?(:created_tickets)).to eq(true)
  end

  it 'can access his open tickets' do
    admin = create(:admin_with_created_tickets)
    expect(admin.created_tickets).to eq(Ticket.where(creator: admin))
  end

  it 'has closed tickets' do
    expect(user_can_respond_to?(:closed_tickets)).to eq(true)
  end

  it 'has creator' do
    expect(user_can_respond_to?(:creator)).to eq(true)
  end

  it 'can access his closed tickets' do
    admin = create(:admin_with_closed_tickets)
    expect(admin.closed_tickets).to eq(Ticket.where(closer: admin))
  end

  it 'can not has customer creator' do
    expect(build(:customer_creates_admin).save).to_not eq(true)
  end

  it 'has admin creator' do
    expect(build(:admin).save).to eq(true)
  end

  it 'can not has agent creator' do
    expect(build(:agent_creates_admin).save).to_not eq(true)
  end

  it 'can not has non user creator unless it is the first admin' do
    expect(build(:non_user_creates_admin).save).to eq(true)
    expect(build(:non_user_creates_admin).save).to_not eq(true)
  end

  private

  def user_has_attribute?(attribute_name)
    obj_has_attribute?(new_admin, attribute_name)
  end

  def user_can_respond_to?(method_name)
    obj_can_respond_to?(new_admin, method_name)
  end
end