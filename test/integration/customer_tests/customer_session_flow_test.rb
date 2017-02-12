#
# class CustomerSessionFlowTest < CustomerFlowTest
#   test 'sign up' do
#     sign_up
#     assert_response :created
#   end
#
#   test 'sign in' do
#     sign_up
#     sign_in
#     assert Customer.find_by_id(response_json['data']['id'])
#     assert_response :success
#   end
#
#   test 'sign out' do
#     sign_up
#     sign_in
#     sign_out
#     assert_response :success
#   end
# end