#!ruby
require 'httparty'
require 'json'

configuration = YAML.load_file("configuration.yml")

# http://api.example.comv1/
api_base_URL = configuration['api_base_url']

puts "Events API resource URL:" +
  (uri = URI.join(api_base_URL, 'public/events')).to_s
response = HTTParty.get(uri,
  :query => {
    'account_id' => configuration['account_id'],
    'start_date' => configuration['start_date']
    })
puts "API response: " +
  response.body, response.code, response.message, response.headers.inspect
