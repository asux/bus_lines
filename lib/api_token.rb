# frozen_string_literal: true

class ApiToken
  def initialize(jwt_secret: Rails.application.credentials.secret_key_base, expire: 1.day)
    @jwt_secret = jwt_secret
    @expire = expire
    @algorithm = 'HS256'
  end

  def encode(data)
    payload = meta.merge(data: data)
    JWT.encode payload, @jwt_secret, @algorithm
  end

  def decode(token)
    JWT.decode token, @jwt_secret, true, { algorithm: @algorithm }
  end

  protected

  def meta
    { exp: @expire.from_now.to_i }
  end
end
