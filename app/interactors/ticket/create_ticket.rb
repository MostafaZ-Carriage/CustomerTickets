class CreateTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || context.ticket.blank? || context.current_user.blank?
  end

  def call
    context.response[:ticket] = Ticket.create!(context.ticket.merge(creator: context.current_user)) rescue context.fail!
  end
end