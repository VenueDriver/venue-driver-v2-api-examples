#!ruby
require 'httparty'
require 'json'

configuration = YAML.load_file("configuration.yml")

# http://api.example.com/v2/
api_base_URL = configuration['api_base_url']

options = {query: {updated_after: configuration['updated_after']}}

puts "Artists API resource URL:" +
  (uri = URI.join(api_base_URL, 'public/artists')).to_s
response = HTTParty.get(uri, options)
puts "API response: #{response.code} #{response.message}"
# puts "API response headers: "
# response.headers.each{|h| puts "#{h}: #{response.headers[h]}"}
puts "API response body: "
puts response.body
