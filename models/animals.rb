require 'httparty'

class Animals
  def self.welcome_message
    "Welcome to Random Animal Facts!\n" +
    "You will now receive fun semi-irregular facts about Random Animals! :fire: :100: :fire: :tada:\n" +
    "You can also get a random fact by sending `/animalfact` from any channel."
  end

  def self.sniff(code)
    options = {
      body: {
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET'],
        code: code,
        redirect_uri: ENV['REDIRECT_URI']
      }
    }
    HTTParty.post('https://slack.com/api/oauth.access', options)
  end

  def self.bark_to(hook_url, msg)
    if hook_url.kind_of?(Array)
      hook_url.each do |h|
        self.bark(h, msg)
      end
    else
      self.bark(hook_url, msg)
    end
  end

  def self.bark(hook_url, msg)
    options = {
      headers: {
        'Content-Type': 'application/json'
      },
      body: {
        text: msg
      }.to_json
    }
    HTTParty.post(hook_url, options)
  end
end
