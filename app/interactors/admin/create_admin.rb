class CreateAdmin
  include Interactor

  before do
    context.fail! if context.response.blank? || context.admin.blank?
  end

  def call
    context.response[:admin] = Admin.create!(context.admin) rescue context.fail!
  end
end