class FindUser
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@user = User.find_by_id(context.id)).blank?
  end

  def call
    context.response[:user] = @user
  end
end