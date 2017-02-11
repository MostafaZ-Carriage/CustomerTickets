class UpdateCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || context.customer.blank? || (@customer = Customer.find_by_id(context.customer[:id])).blank? || context.current_user.blank?
    User.current_user = context.current_user
  end

  def call
    @customer.update!(context.customer) rescue context.fail!
    context.response[:customer] = @customer
  end
end