# module AbstractFlow
#   def sign_up
#     post @sign_up_path, params: {user: {email: @user[:email], password: @user[:password], password_confirmation: @user[:password]}}
#   end
#
#   def sign_in(user_params=nil)
#     user_params||=@user
#     post '/auth/sign_in', params: {email: user_params[:email], password: user_params[:password]}
#   end
#
#   def sign_out
#     header = response.header
#     delete '/auth/sign_out', params: {}, headers: {uid: header['uid'], client: header['client'], 'access-token' => header['access-token']}
#   end
#
#   def operation
#     sign_up
#     sign_in
#     yield
#     sign_out
#   end
#
#   def operation_with_out_sign_up
#     sign_in
#     yield
#     sign_out
#   end
# end