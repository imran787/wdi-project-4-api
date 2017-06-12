class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :update, :destroy]

  # GET /requests
  def index
    @requests = Request.all

    render json: @requests
  end

  # GET /requests/1
  def show
    render json: @request
  end

  # POST /requests
  def create
    @request = @current_user.sent_requests.create!(request_params)

    if @request.save
      render json: @request, status: :created, location: @request
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /requests/1
  def update
    if @request.update(request_params)
      if @request.status === "accepted"
        item = Item.find(@request.item_id)
        item.user_id = @request.buyer_id
        item.save!
        @request.destroy

        render json: { message: 'Request was successfully accepted' }
      else
        render json: @request
      end
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def request_params
    params.require(:request).permit(:buyer_id, :seller_id, :item_id, :status)
  end
end
