class AdminsController < ApplicationController
  include UsersStrongParams
  def index

  end

  def show

  end

  def create
    interactor = CreateAdmin.call(response: @response, admin: user_params)
    render json: interactor.response, status: (interactor.success? ? :created : :not_acceptable)
  end

  def update

  end

  def destroy

  end
end