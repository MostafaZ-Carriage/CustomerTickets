class CreateAdmin
  include Interactor

  before do
    context.fail! if context.response.blank? || context.admin.blank? || context.current_user.blank?
  end

  def call
    context.admin.merge!(creator: context.current_user) unless  context.admin[:creator_id] || context.admin[:creator_type]
    context.response[:admin] = Admin.create!(context.admin) rescue context.fail!
  end
end