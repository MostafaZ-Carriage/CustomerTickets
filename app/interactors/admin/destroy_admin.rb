class DestroyAdmin
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@admin = Admin.find_by_id(context.id)).blank?
  end

  def call
    @admin.destroy! rescue context.fail!
  end
end