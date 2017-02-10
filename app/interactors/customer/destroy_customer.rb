class DestroyCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@customer = Customer.find_by_id(context.id)).blank?
  end

  def call
    @customer.destroy! rescue context.fail!
  end
end