class CreateAgent
  include Interactor

  before do
    context.fail! if context.response.blank? || context.agent.blank?
  end

  def call
    context.response[:agent] = Agent.create!(context.agent) rescue context.fail!
  end
end