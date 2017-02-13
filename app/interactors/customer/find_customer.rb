class FindCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || context.user.blank? || (@customer = Customer.find_by_id(context.user[:id])).blank?
  end

  def call
    context.response[:customer] = @customer
  end
end