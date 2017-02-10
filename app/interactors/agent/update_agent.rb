class UpdateAgent
  include Interactor

  before do
    context.fail! if context.response.blank? || context.agent.blank? || (@agent = Agent.find_by_id(context.agent[:id])).blank?
  end

  def call
    @agent.save!(context.agent) rescue context.fail!
    context.response[:agent] = @agent
  end
end