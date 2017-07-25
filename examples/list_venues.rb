#!ruby
require 'httparty'
require 'json'

# Call this with the API URL, username, password and account_id:
# ruby examples/list_venues.rb http://api.example.com/v1/ user pass 1234

api_base_URL = ARGV[0] # http://api.example.comv1/

query = {}
query[:account_id] = ARGV[1] if ARGV[1]
query[:updated_after] = ARGV[2] if ARGV[2]

puts "Venues API resource URL:" +
  (uri = URI.join(api_base_URL, 'public/venues')).to_s
response = HTTParty.get(uri, {query: query})
puts "API response: #{response.code} #{response.message}"
# puts "API response headers: "
# response.headers.each{|h| puts "#{h}: #{response.headers[h]}"}
puts "API response body: "
puts response.body
