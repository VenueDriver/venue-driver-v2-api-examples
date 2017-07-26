#!ruby
require 'httparty'
require 'json'

# Call this with the API URL, username, password, account_id and start_date:
# ruby examples/list_reservations.rb http://api.example.com/v2/ user pass 1234 "2017-07-25T23:02:16+00:00"

api_base_URL = ARGV[0] # http://api.example.com/v2/

puts "Authentication API resource URL: " +
  (uri = URI.join(api_base_URL, 'auth')).to_s
response = HTTParty.get(uri,
  :query => {:username => ARGV[1], :password => ARGV[2]})
puts "API response" +
  response.body, response.code, response.message, response.headers.inspect
puts "Authorization token: " + (token = JSON.parse(response.body)['token'])

puts "Reservations API resource URL:" +
  (uri = URI.join(api_base_URL, 'public/reservations')).to_s
response = HTTParty.get(uri,
    headers: {'Authorization' => token},
    query: {
      'account_id' => ARGV[3],
      'start_date' => ARGV[4]
    })
puts "API response: #{response.code} #{response.message}"
# puts "API response headers: "
# response.headers.each{|h| puts "#{h}: #{response.headers[h]}"}
puts "API response body: "
puts response.body
