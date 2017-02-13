require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'non user session flow', :type => :request do

  it 'can NOT create agent' do
    post '/agents/', params: {user: {email: 'agent9@agent.agent', password: '123456789', password_confirmation: '123456789'}}
    assert_response :unauthorized
  end

  it 'can NOT create admin' do
      post '/admins/', params: {user: {email: 'admin9@admin.admin', password: '123456789', password_confirmation: '123456789'}}
      assert_response :unauthorized
  end

  it 'can create customer' do
      post '/customers/', params: {user: {email: 'customer9@customer.customer', password: '123456789', password_confirmation: '123456789'}}
      assert_response :created
  end
end