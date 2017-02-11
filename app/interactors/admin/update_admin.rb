class UpdateAdmin
  include Interactor

  before do
    context.fail! if context.response.blank? || context.admin.blank? || (@admin = Admin.find_by_id(context.admin[:id])).blank? || context.current_user.blank?
    User.current_user = context.current_user
  end

  def call
    @admin.update!(context.admin) rescue context.fail!
    context.response[:admin] = @admin
  end
end