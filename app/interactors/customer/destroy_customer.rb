class DestroyCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || (@customer = Customer.find_by_id(context.customer[:id])).blank?|| context.current_user.blank?
    @customer.destroyer = context.current_user
  end

  def call
    @customer.destroy! rescue context.fail!
  end
end