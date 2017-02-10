class FindTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@ticket = Ticket.find_by_id(context.id)).blank?
  end

  def call
    context.response[:ticket] = @ticket
  end
end