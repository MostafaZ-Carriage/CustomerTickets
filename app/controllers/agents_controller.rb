class AgentsController < ApplicationController
  include UsersStrongParams
  def index

  end

  def show

  end

  def create
    interactor = CreateAgent.call(response: @response, agent: user_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :created : :not_acceptable)
  end

  def update
    interactor = UpdateAgent.call(response: @response, agent: user_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :accepted : :not_modified)
  end

  def destroy

  end
end