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

        # handle item id change
        item = Item.find(@request.item_id)
        item.user_id = @request.buyer_id
        item.save!

        seller = User.find(@request.seller_id)
        buyer  = User.find(@request.buyer_id)

        # create message
        message_params = {
          body: "#{seller.first_name} has accepted you're request, you now own #{item.name}",
          sender_id: seller.id,
          receiver_id: buyer.id
        }

        Message.create!(message_params);

        # destroy request
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
    params.require(:request).permit(:buyer_id, :seller_id, :item_id, :status, :body)
  end
end
