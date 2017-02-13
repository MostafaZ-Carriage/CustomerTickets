class CreateAgent
  include Interactor

  before do
    context.fail! if context.response.blank? || context.agent.blank?
  end

  def call
    context.agent.merge!(creator: context.current_user) unless context.agent[:creator_id] || context.agent[:creator_type]
    context.response[:agent] = Agent.create!(context.agent) rescue context.fail!
  end
end