class UpdateTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || context.ticket.blank? || (@ticket = Ticket.find_by_id(context.ticket[:id])).blank? || context.current_user.blank?
    context.ticket.merge!(closer: context.current_user) if context.ticket[:status].to_i == TicketStatus::CLOSE
  end

  def call
    @ticket.update!(context.ticket.merge(updater: context.current_user)) rescue context.fail!
    context.response[:ticket] = @ticket
  end
end