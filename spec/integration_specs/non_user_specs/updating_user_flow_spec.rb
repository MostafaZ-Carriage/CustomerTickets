require 'rails_helper'
require 'integration_specs/abstract_flow'

RSpec.describe 'non user updating user flow', :type => :request do

  it 'can NOT update admin' do
    admin = create(:admin)
    put "/admins/#{admin.id}", params: {user: {email: 'admin119@admin.admin'}}
    assert_response :unauthorized
  end

  it 'can update customer' do
    customer = create(:customer)
    put "/customers/#{customer.id}", params: {user: {email: 'customer1119@customer.customer'}}
    assert_response :unauthorized
  end

  it 'can update agent' do
    agent = create(:agent, creator: create(:admin))
    put "/agents/#{agent.id}", params: {user: {email: 'agent119@agent.agent'}}
    assert_response :unauthorized
  end
end