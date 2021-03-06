class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!, unless: :sign_in_action?
  before_action :initialize_current_user, :initialize_response

  private

  def initialize_response
    @response = {authenticated: true}
  end

  def initialize_current_user
    User.sign_in_action = sign_in_action?
    User.sign_out_action = sign_out_action?
  end

  def sign_in_action?
    devise_controller? && action_name=='create'
  end

  def sign_out_action?
    devise_controller? && action_name=='destroy'
  end
end