require 'test_helper'
require 'integration/abstract_flow'
class AdminFlowTest < ActionDispatch::IntegrationTest
  include AbstractFlow
  setup do
    @user = {email: 'admin10@admin.admin', password: '1234567890'}
    @sign_up_path = '/admins/'
  end
end