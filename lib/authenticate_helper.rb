module AuthenticateHelper
  def authenticate_user
    decoded_token = JsonWebToken.decode(request.headers["HTTP_AUTH_TOKEN"])
    email = decoded_token["email"] if decoded_token
    @current_user = User.find_by(email:)
    render json: { error: "Not Authorized" }, status: :unauthorized unless @current_user
  end

  def user_sign_in?
    !!current_user
  end

  def current_user
    @current_user
  end
end
