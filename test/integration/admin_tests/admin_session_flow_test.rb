
class AdminSessionFlowTest < AdminFlowTest
  test 'admin can not sign up' do
    sign_up
    assert_response :unauthorized
  end

  test 'create admin' do
    create(:admin, email: @user[:email], password: @user[:password])
    operation_with_out_sign_up do
      header = response.header
      post '/admins/', params: {user: {email: 'admin9@admin.admin', password: '123456789', password_confirmation: '123456789'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
      assert_response :created
    end
  end

  test 'sign in' do
    admin = create(:admin)
    sign_in({email: admin.email, password: admin.password})
    assert Admin.find_by_id(response_json['data']['id'])
    assert_response :success
  end

  test 'sign out' do
    admin = create(:admin)
    sign_in({email: admin.email, password: admin.password})
    sign_out
    assert_response :success
  end
end