class JsonWebToken
  SECRET_KEY = "123"

  def self.encode(payload, exp = 1.hour.from_now)
    payload[:exp] = exp.to_i
    payload[:iat] = Time.now.to_i
    
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end