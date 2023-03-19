class AuthenticationController < ApplicationController
  include Authenticatable

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { id: user.id }
      render json: { token: encode_token(payload) }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
