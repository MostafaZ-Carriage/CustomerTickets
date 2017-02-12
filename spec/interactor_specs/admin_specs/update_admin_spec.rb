require 'rails_helper'
RSpec.describe UpdateAdmin do
  include ModelHelper

  let(:new_name) { 'New Name' }

  after do
    Admin.destroy_all
  end

  it 'Update Admin interactor exists' do
    expect(class_exists?(UpdateAdmin)).to eq(true)
  end

  it 'successful update' do
    admin = create(:admin)
    result = UpdateAdmin.call(response: {authenticated: true}, admin: admin.as_json.merge(name: @new_name).symbolize_keys!, current_user: admin)
    expect(result.success?).to eq(true)
    expect(result.response[:admin][:name]).to eq(Admin.last.name)
  end

  it 'unsuccessful update' do
    admin_obj = create(:admin).as_json.symbolize_keys!
    admin_obj[:id] = -1
    result = UpdateAdmin.call(response: {authenticated: true}, admin: admin_obj.symbolize_keys!)
    expect(result.success?).to_not eq(true)
    expect(result.response[:admin]).to eq(nil)
  end
end