require 'rails_helper'
RSpec.describe DestroyAdmin do
  include ModelHelper

  let(:admin_to_destroy_id) { create(:admin).id }

  after do
    Admin.destroy_all
  end

  it 'Destroy Admin interactor exists' do
    expect(class_exists?(DestroyAdmin)).to eq(true)
  end

  it 'successful destroy' do
    result = DestroyAdmin.call(response: {authenticated: true}, id: admin_to_destroy_id)
    expect(result.success?).to eq(true)
    expect(Admin.find_by_id(admin_to_destroy_id)).to eq(nil)
  end

  it 'unsuccessful destroy' do
    result = DestroyAdmin.call(response: {}, id: admin_to_destroy_id)
    expect(result.success?).to_not eq(true)
    expect(Admin.find_by_id(admin_to_destroy_id).present?).to eq(true)
  end
end