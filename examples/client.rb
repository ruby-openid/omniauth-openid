#!/usr/bin/env ruby

require "bundler/inline"

gemfile do
  source "https://rubygems.org"

  gemspec path: "../"

  gem "httparty"
end

response = HTTParty.get("http://127.0.0.1:4567/auth/open_id/callback", body: "{\"foo\":\"bar\"}", headers: {"Content-Type" => "plain/text"})

# NOTE: You'll see an invalid_credentials response.
puts "GET response.body: #{response.body.inspect}"

# response = HTTParty.post("http://127.0.0.1:4567/auth/open_id/callback", body: "{\"foo\":\"bar\"}", headers: { 'Content-Type' => 'plain/text' })
#
# # NOTE: You'll see an invalid_credentials response.
# puts "POST response.body: #{response.body.inspect}"
