#!ruby
require 'httparty'
require 'json'

# Call this with the API URL, username, password and account_id:
# ruby examples/list_venues.rb http://api.example.com/v1/ user pass 1234

api_base_URL = ARGV[0] # http://api.example.comv1/

puts "Authentication API resource URL: " +
  (uri = URI.join(api_base_URL, 'auth')).to_s
response = HTTParty.get(uri,
  :query => {:username => ARGV[1], :password => ARGV[2]})
puts "API response" +
  response.body, response.code, response.message, response.headers.inspect
puts "Authorization token: " + (token = JSON.parse(response.body)['token'])

puts "Venues API resource URL:" +
  (uri = URI.join(api_base_URL, 'venues')).to_s
response = HTTParty.get(uri,
  :headers => {'Authorization' => token},
  :query => {'account_id' => ARGV[3]})
puts "API response: " +
  response.body, response.code, response.message, response.headers.inspect