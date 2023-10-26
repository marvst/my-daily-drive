require 'httparty'

class MailjetService
    BASE_URI = "https://api.mailjet.com/v3.1"
    API_KEY = ENV['MAILJET_API_KEY']
    SECRET_KEY = ENV['MAILJET_SECRET_KEY']
    FROM_EMAIL = "marcosvst98@gmail.com"
    FROM_NAME = "Marcos Vinícius"

    def self.send_email_to(email_address, **args)
        
        response = HTTParty.post(
            "#{BASE_URI}/send",
            basic_auth: { username: API_KEY, password: SECRET_KEY },
            body: {
                "Messages":[
                    {
                        "From": {
                            "Email": FROM_EMAIL,
                            "Name": FROM_NAME
                        },
                        "To": [
                            {
                                "Email": email_address
                            }
                        ],
                        "Subject": args[:subject],
                        "TextPart": args[:text_part],
                        "HTMLPart": args[:html_part]
                    }
                ]
            }.to_json
        )

        if response.code != 200
            return false
        end

        true
    end
end