require 'rails_helper'
RSpec.describe User, :type => :model do
  include ModelHelper
  let(:new_user) { User.new }

  it 'User class exists' do
    expect(class_exists?(User)).to eq(true)
  end

  it ' has email' do
    expect(user_has_attribute?(:email)).to eq(true)
  end

  it ' has created_at' do
    expect(user_has_attribute?(:created_at)).to eq(true)
  end

  it ' has updated_at' do
    expect(user_has_attribute?(:updated_at)).to eq(true)
  end

  it ' has type' do
    expect(user_has_attribute?(:type)).to eq(true)
  end

  it 'Email should be presence' do
    expect(new_user.valid?).to_not eq(true)
  end

  it 'Email should be unique' do
    new_user.email = create(:customer).email
    expect(new_user.valid?).to_not eq(true)
  end

  it 'Type should be nil' do
    expect(new_user.type).to eq(nil)
  end

  it ' has creator_type' do
    expect(user_has_attribute?(:creator_type)).to eq(true)
  end

  it ' has creator_id' do
    expect(user_has_attribute?(:creator_id)).to eq(true)
  end

  it ' can not has customer creator' do
    expect(build(:customer_creates_user).save).to_not eq(true)
  end

  it ' can not has admin creator' do
    expect(build(:admin_creates_user).save).to_not eq(true)
  end

  it ' can not has agent creator' do
    expect(build(:agent_creates_user).save).to_not eq(true)
  end

  it ' can not has non user creator' do
    expect(build(:non_user_creates_user).save).to_not eq(true)
  end

  private

  def user_has_attribute?(attribute_name)
    obj_has_attribute?(new_user, attribute_name)
  end
end