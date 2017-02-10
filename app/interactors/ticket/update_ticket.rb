class UpdateTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || context.ticket.blank? || (@ticket = Ticket.find_by_id(context.ticket[:id])).blank?
  end

  def call
    @ticket.save!(context.ticket) rescue context.fail!
    context.response[:ticket] = @ticket
  end
end