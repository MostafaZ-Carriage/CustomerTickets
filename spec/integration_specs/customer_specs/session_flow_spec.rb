require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'customer session flow', :type => :request do
  include AbstractFlow
  let(:user) {{email: 'customer10@customer.customer', password: '1234567890'}}
  let(:sign_up_path) {'/customers/'}
  it 'sign up' do
    sign_up
    assert_response :created
  end

  it 'sign in' do
    sign_up
    sign_in
    assert Customer.find_by_id(response_json['data']['id'])
    assert_response :success
  end

  it 'sign out' do
    sign_up
    sign_in
    sign_out
    assert_response :success
  end
end