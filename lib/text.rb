require 'twilio-ruby'
require 'dotenv/load'



class Texter

  def self.message()



    account_sid = 'AC7148592f678727712cd5e2a082e3446c'
    auth_token = 'f8f1f90121423ef88fe353d10ec9bb6e'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['FROM']# Your Twilio number
    to = ENV['TO'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Order Status Change"
    )
  end

end
