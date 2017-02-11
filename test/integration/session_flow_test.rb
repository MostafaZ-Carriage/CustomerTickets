require 'test_helper'
class SessionFlowTest < ActionDispatch::IntegrationTest

  test 'sign up' do
    post '/customers/', params: {user: {email: 'customer10@customer.customer', password: '1234567890', password_confirmation: '1234567890'}}
    assert_response :created
  end

  test 'sign in' do
    sign_in
    assert Customer.find_by_id(JSON.parse(response.body)['data']['id'])
    assert_response :success
  end

  test 'sign out' do
    sign_in
    header = response.header
    delete '/auth/sign_out', params: {}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
    assert_response :success
  end

  private

  def sign_in
    customer = create(:customer)
    post '/auth/sign_in', params: {email: customer.email, password: customer.password}
  end
end