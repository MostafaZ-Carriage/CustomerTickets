class FindAgent
  include Interactor

  before do
    context.fail! if context.response.blank? || context.id.blank? || (@agent = Agent.find_by_id(context.id)).blank?
  end

  def call
    context.response[:agent] = @agent
  end
end