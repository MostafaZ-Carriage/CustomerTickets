class UpdateCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || context.customer.blank? || (@customer = Customer.find_by_id(context.customer[:id])).blank? || context.current_user.blank?
  end

  def call
    @customer.update!(context.customer.merge(updater: context.current_user)) rescue context.fail!
    context.response[:customer] = @customer
  end
end