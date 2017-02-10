class DestroyAgent
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@agent = Agent.find_by_id(context.id)).blank?
  end

  def call
    @agent.destroy! rescue context.fail!
  end
end