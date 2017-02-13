module UsersStrongParams
  extend ActiveSupport::Concern

  private
  def user_params
    safe_params = params.require(:user).permit(:id, :password, :password_confirmation, :email, :name)
    safe_params.merge({id: params[:id]}) if safe_params[:id].blank? && params[:id].present?
  end
end