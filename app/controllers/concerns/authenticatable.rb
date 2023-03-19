require "jwt"

module Authenticatable
  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def decode_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
  rescue
    nil
  end

  def current_user
    return @current_user if @current_user
    header = request.headers["Authorization"]
    return nil if header.nil?
    token = header.split(" ").last
    return nil if token.nil?
    payload = decode_token(token)
    @current_user = User.find_by(id: payload["id"])
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user!
    render json: { error: "You need to be logged in to do that" }, status: :unauthorized unless logged_in?
  end
end
