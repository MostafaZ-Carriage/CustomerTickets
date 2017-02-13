module UsersStrongParams
  extend ActiveSupport::Concern

  private
  def user_params
    safe_params = params.require(:user).permit(:id, :password, :password_confirmation, :email, :name)
    safe_params[:id].blank? && params[:id].present? ? safe_params.merge({id: params[:id]}) : safe_params
  end
end