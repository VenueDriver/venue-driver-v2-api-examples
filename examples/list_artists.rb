#!ruby
require 'httparty'
require 'json'

# Call this with the API URL, username, and password:
# ruby examples/list_artists.rb http://api.example.com/v2/ user pass

api_base_URL = ARGV[0] # http://api.example.com/v2/

options =
  if(ARGV[1])
    {query: {updated_after: ARGV[1]}}
  else
    {}
  end

puts "Artists API resource URL:" +
  (uri = URI.join(api_base_URL, 'public/artists')).to_s
response = HTTParty.get(uri, options)
puts "API response: #{response.code} #{response.message}"
# puts "API response headers: "
# response.headers.each{|h| puts "#{h}: #{response.headers[h]}"}
puts "API response body: "
puts response.body
