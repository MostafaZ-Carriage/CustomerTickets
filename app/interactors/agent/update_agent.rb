class UpdateAgent
  include Interactor

  before do
    context.fail! if context.response.blank? || context.agent.blank? || (@agent = Agent.find_by_id(context.agent[:id])).blank? || context.current_user.blank?
  end

  def call
    @agent.update!(context.agent.merge(updater: context.current_user)) rescue context.fail!
    context.response[:agent] = @agent
  end
end