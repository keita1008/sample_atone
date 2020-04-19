require 'net/http'
require 'uri'
require "json"
require "byebug"

uri = URI.parse("http://p0kerhands.herokuapp.com/api/v1/cards/check")

http = Net::HTTP.new(uri.host, uri.port)

headers = { "Content-Type" => "application/json" }

req = Net::HTTP::Post.new(uri.path)

body = {
	"cards": [
		ARGV[0],
		ARGV[1],
		ARGV[2]
	]
}

req.body = body.to_json

req.initialize_http_header(headers)

response = http.request(req)

puts response.code
puts response.body