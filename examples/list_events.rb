#!ruby
require 'httparty'
require 'json'

# Call this with the API URL, username, password, and venue_id:
# ruby examples/list_events.rb http://api.example.com/v1/ user pass 1234

api_base_URL = ARGV[0] # http://api.example.comv1/

puts "Events API resource URL:" +
  (uri = URI.join(api_base_URL, 'public/events')).to_s
response = HTTParty.get(uri,
  :query => {
    'account_id' => ARGV[1],
    'start_date' => ARGV[2]
    })
puts "API response: " +
  response.body, response.code, response.message, response.headers.inspect
