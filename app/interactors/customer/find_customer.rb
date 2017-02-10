class FindCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@customer = Customer.find_by_id(context.id)).blank?
  end

  def call
    context.response[:customer] = @customer
  end
end