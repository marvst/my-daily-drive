require "rails_helper"

describe "POST /auth/generate", type: :request do
    it "errors with bad request when the request is missing the emaill address" do
        # Fails when email is nil
        post "/api/v1/auth/generate", params: {
            emailAddress: nil
        }
        expect(response).to have_http_status(:bad_request)

        # Fails when email is empty
        post "/api/v1/auth/generate", params: {
            emailAddress: ""
        }
        expect(response).to have_http_status(:bad_request)

        # Fails when email is not present
        post "/api/v1/auth/generate", params: {}
        expect(response).to have_http_status(:bad_request)
    end

    it 'errors with internal server error when the processing fails due to any reason' do
        allow(Authentication).to receive(:generate_token_for).and_raise(StandardError.new('Simulated error'))

        post "/api/v1/auth/generate", params: {
            emailAddress: "marcosvst98@gmail.com"
        }

        expect(response).to have_http_status(:internal_server_error)
    end

    it 'returns success when the token is generated and sent to the provided email address' do
         post "/api/v1/auth/generate", params: {
            emailAddress: "marcosvst98@gmail.com"
        }

        expect(response).to have_http_status(:ok)
    end
end

describe "POST /auth", type: :request do
    it "errors with bad request when the request is missing the access" do
        # Fails when email is nil
        post "/api/v1/auth", params: {
            accessToken: nil
        }
        expect(response).to have_http_status(:bad_request)

        # Fails when email is empty
        post "/api/v1/auth", params: {
            accessToken: ""
        }
        expect(response).to have_http_status(:bad_request)

        # Fails when email is not present
        post "/api/v1/auth", params: {}
        expect(response).to have_http_status(:bad_request)
    end

    it "errors with internal server error when the token is invalid" do
        post "/api/v1/auth", params: {
            accessToken: "blablabla"
        }
        expect(response).to have_http_status(:bad_request)
    end

    it "returns success when the token is not expired yet" do
        post "/api/v1/auth/generate", params: {
            emailAddress: "marcosvst98@gmail.com"
        }

        access_token = JSON.parse(response.body)

        post "/api/v1/auth", params: {
            accessToken: access_token["access_token"]
        }
        expect(response).to have_http_status(:ok)
    end

    it "create user if token type is signup" do
        post "/api/v1/auth/generate", params: {
            emailAddress: "marcosvst98@gmail.com"
        }

        access_token = JSON.parse(response.body)

        post "/api/v1/auth", params: {
            accessToken: access_token["access_token"]
        }
        expect(response).to have_http_status(:ok)
        expect(User.count).to eq(1)

        post "/api/v1/auth/generate", params: {
            emailAddress: "marcosvst98@gmail.com"
        }
        
        access_token = JSON.parse(response.body)

        post "/api/v1/auth", params: {
            accessToken: access_token["access_token"]
        }
        expect(response).to have_http_status(:ok)
        expect(User.count).to eq(1)
    end
end