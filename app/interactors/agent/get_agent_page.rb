class GetAgentPage
  include Interactor

  before do
    context.fail! if context.response.blank?
  end

  def call
    context.response[:agents] = Agent.paginate(page: context.page.presence||1, per_page: context.per_page.presence)
  end
end