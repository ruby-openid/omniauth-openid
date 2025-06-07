# external gems
require "version_gem"

# this library's version
require "omniauth/openid/version"

# Configure version before loading the rest of the library
OmniAuth::OpenID::Version.class_eval do
  extend VersionGem::Basic
end

# This library
require "omniauth/strategies/open_id"
