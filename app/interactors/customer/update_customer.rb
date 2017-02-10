class UpdateCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || context.customer.blank? || (@customer = Customer.find_by_id(context.customer[:id])).blank?
  end

  def call
    @customer.save!(context.customer) rescue context.fail!
    context.response[:customer] = @customer
  end
end