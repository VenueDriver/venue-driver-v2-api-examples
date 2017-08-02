#!ruby
require 'httparty'
require 'json'

configuration = YAML.load_file("configuration.yml")

# http://api.example.com/v2/
api_base_URL = configuration['api_base_url']

query = {}
query[:account_id] = configuration['account_id']
query[:updated_after] = configuration['updated_after']

puts "Venues API resource URL:" +
  (uri = URI.join(api_base_URL, 'public/venues')).to_s
response = HTTParty.get(uri, {query: query})
puts "API response: #{response.code} #{response.message}"
# puts "API response headers: "
# response.headers.each{|h| puts "#{h}: #{response.headers[h]}"}
puts "API response body: "
puts response.body
