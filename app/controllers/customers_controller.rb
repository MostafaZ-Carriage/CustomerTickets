class CustomersController < ApplicationController
  include UsersStrongParams
  skip_before_action :authenticate_user!, only: [:create]
  def index
    interactor = GetCustomerPage.call(response: @response, page: params[:page], per_page: params[:per_page])
    render json: interactor.response, status: (interactor.success? ? :ok : :unprocessable_entity)
  end

  def show
    interactor = FindCustomer.call(response: @response, user: user_params)
    render json: interactor.response, status: (interactor.success? ? :ok : :not_found)
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