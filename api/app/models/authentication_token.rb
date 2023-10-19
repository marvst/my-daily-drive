class AuthenticationToken < ApplicationRecord
  

  def self.generate(email_address)
      user = User.find_by email: email_address

      access_token = JsonWebToken.encode(
        {
          email: email_address,
          type: user.nil? ? 'signup' : 'signin'
        }
      )

      access_token
  end
end
