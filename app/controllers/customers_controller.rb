class CustomersController < ApplicationController
  include UsersStrongParams
  skip_before_action :authenticate_user!, only: [:create]
  def index

  end

  def show

  end

  def create
    interactor = CreateCustomer.call(response: @response, customer: user_params)
    render json: interactor.response, status: (interactor.success? ? :created : :not_acceptable)
  end

  def update

  end

  def destroy

  end
end