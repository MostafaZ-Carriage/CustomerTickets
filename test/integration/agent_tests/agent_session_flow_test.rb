#
# class AgentSessionFlowTest < AgentFlowTest
#   test 'agent can not sign up' do
#     sign_up
#     assert_response :unauthorized
#   end
#
#   test 'create agent' do
#     create(:admin, email: @user[:email], password: @user[:password])
#     operation_with_out_sign_up do
#       header = response.header
#       post '/agents/', params: {user: {email: 'agent9@agent.agent', password: '123456789', password_confirmation: '123456789'}}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
#       assert_response :created
#     end
#   end
#
#   test 'sign in' do
#     agent = create(:agent, creator: create(:admin))
#     sign_in({email: agent.email, password: agent.password})
#     assert Agent.find_by_id(response_json['data']['id'])
#     assert_response :success
#   end
#
#   test 'sign out' do
#     agent = create(:agent, creator: create(:admin))
#     sign_in({email: agent.email, password: agent.password})
#     sign_out
#     assert_response :success
#   end
# end