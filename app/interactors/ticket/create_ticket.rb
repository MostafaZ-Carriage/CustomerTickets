class CreateTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || context.ticket.blank? || context.current_user.blank?
  end

  def call
    context.ticket.merge!(creator: context.current_user) unless context.ticket[:creator_id] || context.ticket[:creator_type]
    context.response[:ticket] = Ticket.create!(context.ticket) rescue context.fail!
  end
end