class DestroyAgent
  include Interactor

  before do
    context.fail! if context.response.blank? || (@agent = Agent.find_by_id(context.agent[:id])).blank?|| context.current_user.blank?
    @agent.destroyer = context.current_user
  end

  def call
    @agent.destroy! rescue context.fail!
  end
end