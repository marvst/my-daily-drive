require 'rails_helper'

RSpec.describe AuthenticationToken, type: :model do
  # context "when generating the token" do
  #   it "should have the sign up type when email is not registered yet" do
  #     # Create user to ensure the email is registered
  #     user = User.find_or_create_by!(email: 'existent-email@gmail.com')
    
  #     token = AuthenticationToken::generate("existent-email@gmail.com")
      
  #     expect(token).not_to be(nil)
  
  #     decoded_token = JsonWebToken.decode(token)
  
  #     expect(decoded_token).not_to be(nil)
  #     expect(decoded_token[:type]).to eq('signin')
  #   end
    
  #   it "should have the sign in type when email is already registered" do
  #     token = AuthenticationToken::generate("unexistent-email@gmail.com")
          
  #     expect(token).not_to be(nil)
  
  #     decoded_token = JsonWebToken.decode(token)
  
  #     expect(decoded_token).not_to be(nil)
  #     expect(decoded_token[:type]).to eq('signup')
  #   end
  
  #   it "should expire one hour after it was created" do
  #     token = AuthenticationToken.generate("unexistent-email@gmail.com")
  #     expect(token).not_to be(nil)
  
  #     decoded_token = JsonWebToken.decode(token)
  #     expect(decoded_token).not_to be(nil)
  
  #     expiration_time = Time.at(decoded_token[:exp])
  #     creation_time = Time.at(decoded_token[:iat])
  #     expect(expiration_time).to be_within(1.hour).of(creation_time)
  #   end
  
  #   it "should contain all required information (iat, exp, email, and type)" do
  #     token = AuthenticationToken::generate("unexistent-email@gmail.com")
  #     expect(token).not_to be(nil)
  
  #     decoded_token = JsonWebToken.decode(token)
  #     expect(decoded_token).not_to be(nil)
  
  #     expect(decoded_token).to have_key(:iat)
  #     expect(decoded_token).to have_key(:exp)
  #     expect(decoded_token).to have_key(:email)
  #     expect(decoded_token).to have_key(:type)
  #   end
  # end

  # context "when verifying the token" do
  #   it "should contain all required information (iat, exp, email, and type)"
  #   it "should not be expired"
  #   it "should register email when type is signup and user is not registered yet"
  #   it "should return conflict when type is signup but email is already registered"
  # end
end
