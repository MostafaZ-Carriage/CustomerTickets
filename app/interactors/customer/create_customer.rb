class CreateCustomer
  include Interactor

  before do
    context.fail! if context.response.blank? || context.customer.blank?
  end

  def call
    context.customer.merge!(creator: context.current_user) unless  context.customer[:creator_id] || context.customer[:creator_type]
    context.response[:customer] = Customer.create!(context.customer) rescue context.fail!
  end
end