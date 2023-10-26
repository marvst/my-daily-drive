module Api
  module V1
    class AuthenticationController < ApplicationController
      BASE_URL = 'http://localhost:8080/auth'

      def generate
        params.require(:emailAddress)

        token = Authentication.generate_token_for(params[:emailAddress])

        if token.nil? || token == ""
          raise StandardError("Failed to generate access token.")
        end

        # email_was_sent = MailjetService.send_email_to(
        #   params[:emailAddress], 
        #   subject: 'My Daily Drive access link',
        #   text_part: 'Welcome back!',
        #   html_part: "<h1>Hello!</h1><a href='#{BASE_URL}?access_token=#{token}'>Click here to access your account.</a>"
        # )

        email_was_sent = true

        unless email_was_sent
          raise StandardError("Failed to send email message.")
        end

        render json: { "access_token": token }, status: :ok
      rescue ActionController::ParameterMissing => e
        render status: :bad_request
      rescue StandardError => e
        render json: { "error_description": e }, status: :internal_server_error
      end

      def auth
        params.require(:accessToken)

        if Authentication.is_token_valid?(params[:accessToken])
          render status: :ok
        else
          render status: :bad_request 
        end
      rescue ActionController::ParameterMissing => e
        render status: :bad_request
      rescue StandardError => e
        render json: { "error_description": e }, status: :internal_server_error
      end
    end    
  end
end