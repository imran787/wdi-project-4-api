class AuthenticationsController < ApplicationController
  skip_before_action :authenticate_user!

  def register
    p "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ REGISTER"
    user = User.new(user_params)
    if user.save
      token = Auth.issue({id: user.id})
      render json: { token: token, user: UserSerializer.new(user)}, status: :ok
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def login
    p "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ LOGIN"
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      token = Auth.issue({id: user.id})
      render json: { token: token, user: UserSerializer.new(user)}, status: :ok
    else
      render json: {errors: ['Your credentials for login are invalid!']}, status: 401 #code = unauthorized
    end
  end

  private

    def user_params
      hash = {}
      hash.merge! params.slice(:username, :first_name, :last_name, :email, :password, :password_confirmation).permit!
      hash
    end

end
