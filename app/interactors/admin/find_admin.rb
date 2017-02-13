class FindAdmin
  include Interactor

  before do
    context.fail! if context.response.blank? || context.user.blank? || (@admin = Admin.find_by_id(context.user[:id])).blank?
  end

  def call
    context.response[:admin] = @admin
  end
end