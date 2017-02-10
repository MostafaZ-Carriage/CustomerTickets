class FindAdmin
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@admin = Admin.find_by_id(context.id)).blank?
  end

  def call
    context.response[:admin] = @admin
  end
end