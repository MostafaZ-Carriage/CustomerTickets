require 'test_helper'
require 'integration/abstract_flow'
class CustomerFlowTest < ActionDispatch::IntegrationTest
  include AbstractFlow
  setup do
    @user = {email: 'customer10@customer.customer', password: '1234567890'}
    @sign_up_path = '/customers/'
  end
end