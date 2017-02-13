class CustomersController < ApplicationController
  include UsersStrongParams
  skip_before_action :authenticate_user!, only: [:create]
  def index

  end

  def show

  end

  def create
    interactor = CreateCustomer.call(response: @response, customer: user_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :created : :not_acceptable)
  end

  def update
    interactor = UpdateCustomer.call(response: @response, customer: user_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :accepted : :not_modified)
  end

  def destroy
    interactor = DestroyCustomer.call(response: @response, customer: user_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :ok : :no_content)
  end
end