module Api
  module V1
    class AuthenticationController < ApplicationController
      BASE_URL = 'http://localhost:300/auth'

      def generate
        token = Authentication.generate_token(params[:email_address])
        # Send email

        render status: 204
      end

      def auth
        # Used to register or login users
        # 1. Decode token
        # 2. Check if it is still valid
        # 2. Check if it is still valid
      end
    end    
  end
end