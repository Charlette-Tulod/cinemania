class JsonWebToken
  HMAC_SECRET = Rails.application.credentials.secret_key_base || ENV["SECRET_KEY_BASE"]

  def self.encode(payload, exp = 24.hours.from_now)
    raise "Missing secret key base" unless HMAC_SECRET

    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    raise "Missing secret key base" unless HMAC_SECRET

    body = JWT.decode(token, HMAC_SECRET, true, { algorithm: "HS256" }).first
    HashWithIndifferentAccess.new(body)
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end
