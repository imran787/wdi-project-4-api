class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def authenticate_user!
    render json: { errors: ["Unauthorized"]}, status: 401 unless
    user_signed_in?
  end

  def user_signed_in? #check if user is logged in,
    !!current_user # !! = positive, truthy, becasue we are looking for a boolean value to determine if they are logged in or not
  end

  def current_user
    @current_user ||= User.find(decoded_token[:id]) if id_found? #do everything left of if if it is true, otherwise below
  rescue # if above is unable to process, dont render error but just pass nill, becasue it shows that there is no current user
    nil
  end

  private

  def id_found?
    token && decoded_token && decoded_token[:id]
  end

  def decoded_token
    @decoded_token ||= Auth.decode(token) if token
  end

  def token
    @token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split.last

    end
  end
end
