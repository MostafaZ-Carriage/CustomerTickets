class AgentsController < ApplicationController
  include UsersStrongParams
  def index

  end

  def show

  end

  def create
    interactor = CreateAgent.call(response: @response, agent: user_params)
    render json: interactor.response, status: (interactor.success? ? :created : :not_acceptable)
  end

  def update

  end

  def destroy

  end
end