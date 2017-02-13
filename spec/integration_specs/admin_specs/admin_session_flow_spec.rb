require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'admin session flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'admin10@admin.admin', password: '1234567890'}}
  let(:sign_up_path) {'/admins/'}

  it 'admin can not sign up' do
    sign_up
    assert_response :unauthorized
  end

  it 'sign in' do
    admin = create(:admin)
    sign_in({email: admin.email, password: admin.password})
    assert Admin.find_by_id(response_json['data']['id'])
    assert_response :success
  end

  it 'sign out' do
    admin = create(:admin)
    sign_in({email: admin.email, password: admin.password})
    sign_out
    assert_response :success
  end
end