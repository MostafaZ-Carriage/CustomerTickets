class UpdateTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || context.ticket.blank? || (@ticket = Ticket.find_by_id(context.ticket[:id])).blank?
    if context.ticket[:status] == TicketStatus::CLOSE && context.current_user.blank?
      context.fail!
    else
      context.ticket[:closer] = context.current_user
    end
  end

  def call
    @ticket.update!(context.ticket.merge(updater: context.current_user)) rescue context.fail!
    context.response[:ticket] = @ticket
  end
end