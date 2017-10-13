class AuthController < ApplicationController
  # skip_before_action :authorized, only: [:create]
  def create

    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      token = encode_token({ user_id: user.id, username: user.username})
      render json: { user: user, jwt: token}
    else render json: {message: "Invalid User"}
    end
  end
end
