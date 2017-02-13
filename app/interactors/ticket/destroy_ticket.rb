class DestroyTicket
  include Interactor

  before do
    context.fail! if context.response.blank? || (@ticket = Ticket.find_by_id(context.ticket[:id])).blank?|| context.current_user.blank?
    @ticket.destroyer = context.current_user
  end

  def call
    @ticket.destroy! rescue context.fail!
  end
end