class TicketsController < ApplicationController
  def index
    interactor = GetTicketPage.call(response: @response, page: params[:page], per_page: params[:per_page])
    render json: interactor.response, status: (interactor.success? ? :ok : :unprocessable_entity)
  end

  def show
    interactor = FindTicket.call(response: @response, ticket: ticket_params)
    render json: interactor.response, status: (interactor.success? ? :ok : :not_found)
  end

  def create
    interactor = CreateTicket.call(response: @response, ticket: ticket_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :created : :not_acceptable)
  end

  def update
    interactor = UpdateTicket.call(response: @response, ticket: ticket_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :accepted : :not_modified)
  end

  def destroy
    interactor = DestroyTicket.call(response: @response, ticket: ticket_params, current_user: current_user)
    render json: interactor.response, status: (interactor.success? ? :ok : :no_content)
  end

  private

  def ticket_params
    safe_params = params.require(:ticket).permit(:id, :status)
    safe_params[:id].blank? && params[:id].present? ? safe_params.merge({id: params[:id]}) : safe_params
  end
end