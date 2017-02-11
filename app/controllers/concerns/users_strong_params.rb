module UsersStrongParams
  extend ActiveSupport::Concern

  private
  def user_params
    params.require(:user).permit(:id, :password, :password_confirmation, :email, :name)
  end
end