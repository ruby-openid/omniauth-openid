require "rubygems"
require "bundler"

Bundler.setup(:default, :development, :example)
require "sinatra"
require "omniauth-openid"
require "openid/store/filesystem"

use Rack::Session::Cookie

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
