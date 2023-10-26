class Authentication < ApplicationRecord
  ACCESS_TYPE = {
    SIGNUP: "signup",
    SIGNIN: "signin"
  }

  def self.generate_token_for(email_address)
      user = User.find_by email: email_address

      access_token = JsonWebToken.encode(
        {
          email: email_address,
          type: user.nil? ? ACCESS_TYPE[:SIGNUP] : ACCESS_TYPE[:SIGNIN]
        }
      )

      access_token
  end

  def self.is_token_valid?(access_token)
    decoded_token = JsonWebToken.decode(access_token)

    return false unless decoded_token
    return false if decoded_token[:exp] < Time.now.to_i

    if decoded_token[:type] == ACCESS_TYPE[:SIGNUP]
      User.create(email: decoded_token[:email])
    end

    true
  end
end
