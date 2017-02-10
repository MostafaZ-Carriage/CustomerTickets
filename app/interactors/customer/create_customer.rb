class CreateCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || context.customer.blank?
  end

  def call
    context.response[:customer] = Customer.create!(context.customer) rescue context.fail!
  end
end