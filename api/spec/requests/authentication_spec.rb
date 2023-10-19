require "rails_helper"

describe "POST /auth/generate", type: :request do
    it 'returns success when the token is generated and sent to the provided email address'
    it "errors when the request is missing the emaill address"
    it 'errors when the token fails to be generated for any reason'
    # it "should send an email to the user containing a link with a JWT in it" do
    # end

    # it "should return to the user if the user had already registered or not" do
    # end

    # it "should error when JWT is expired" do
    # end

    # it "should error when JWT is not recognized" do
    # end

    # it "should error when JWT is not recognized" do
    # end

     # post :generate, params: {
        #   email: "marcosvst98+mdd+1@gmail.com"
        # }
end