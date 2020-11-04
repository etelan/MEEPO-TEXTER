require 'twilio-ruby'
require 'dotenv/load'



class Texter

  def self.message()



    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']
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
