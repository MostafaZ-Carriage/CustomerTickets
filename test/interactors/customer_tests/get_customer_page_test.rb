require 'test_helper'
class GetCustomerPageTest < ActiveSupport::TestCase

  setup do
    (0...BULK_CREATE_SIZE).each {|i| create(:customer, email: "xxxx#{i}@xxx.xxx")}
  end

  test 'Get Customer Page interactor exists' do
    class_exists?(GetCustomerPage)
  end

  test 'send page' do
    result = GetCustomerPage.call(response: {authenticated: true}, page: 1, per_page: BULK_CREATE_SIZE-1)
    assert result.success?
    assert result.response[:customers].size == BULK_CREATE_SIZE-1
  end

  test 'Do not send page' do
    result = GetCustomerPage.call(response: {authenticated: true})
    assert result.success?
    assert result.response[:customers].size == BULK_CREATE_SIZE
  end
end