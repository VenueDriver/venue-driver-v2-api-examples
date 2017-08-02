#!ruby
require 'httparty'
require 'json'

configuration = YAML.load_file("configuration.yml")

# http://api.example.com/v2/
api_base_URL = configuration['api_base_url']

puts "Authentication API resource URL: " +
  (uri = URI.join(api_base_URL, 'auth')).to_s
response = HTTParty.get(uri,
  :query => {
    :username => configuration['username'],
    :password => configuration['password']})
puts "API response" +
  response.body, response.code, response.message, response.headers.inspect
puts "Authorization token: " + (token = JSON.parse(response.body)['token'])

puts "Reservations API resource URL:" +
  (uri = URI.join(api_base_URL, 'reservations')).to_s
response = HTTParty.get(uri,
    headers: {'Authorization' => token},
    query: {
      'account_id' => configuration['account_id'],
      'updated_after' => configuration['updated_after']
    })
puts "API response: #{response.code} #{response.message}"
# puts "API response headers: "
# response.headers.each{|h| puts "#{h}: #{response.headers[h]}"}
puts "API response body: "
puts response.body
