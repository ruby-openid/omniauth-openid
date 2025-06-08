#!/usr/bin/env ruby

require "bundler/inline"

gemfile do
  source "https://rubygems.org"

  gemspec path: "../"

  gem "sinatra"
  gem "rackup"
  gem "puma"
  gem "json", require: false
  gem "nap", require: "rest"
end

require "json"
require "securerandom"
require "sinatra"
require "omniauth-openid"
require "openid/store/filesystem"

use Rack::Session::Cookie, secret: SecureRandom.hex(64)

use OmniAuth::Builder do
  provider :open_id, store: OpenID::Store::Filesystem.new("/tmp")
end

get "/" do
  <<-HTML
  <ul>
    <li><a href='/auth/open_id'>Sign in with OpenID</a></li>
  </ul>
  HTML
end

[:get, :post].each do |method|
  send method, "/auth/:provider/callback" do
    content_type "text/plain"
    request.env["omniauth.auth"].info.to_hash.inspect
  end
end

Sinatra::Application.run!
