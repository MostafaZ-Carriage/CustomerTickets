class DestroyTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@ticket = Ticket.find_by_id(context.id)).blank?
  end

  def call
    @ticket.destroy! rescue context.fail!
  end
end