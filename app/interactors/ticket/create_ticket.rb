class CreateTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || context.ticket.blank?
  end

  def call
    context.response[:ticket] = Ticket.create!(context.ticket) rescue context.fail!
  end
end