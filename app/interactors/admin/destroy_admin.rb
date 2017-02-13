class DestroyAdmin
  include Interactor

  before do
    context.fail! if context.response.blank? || (@admin = Admin.find_by_id(context.admin[:id])).blank? || context.current_user.blank?
    @admin.destroyer = context.current_user
  end

  def call
    @admin.destroy! rescue context.fail!
  end
end