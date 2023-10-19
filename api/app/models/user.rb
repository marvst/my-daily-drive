class User < ApplicationRecord
    generates_token_for :signup_and_signin, expires_in: 1.hour do
        123
    end
end
