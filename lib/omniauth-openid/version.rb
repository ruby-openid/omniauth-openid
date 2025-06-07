# DEPRECATED
# TODO[v3]: Remove this file entirely with v3 release.
# :nocov:
unless defined?(OmniAuth::Identity::Version::VERSION)
  # external gems
  require "version_gem"

  # this library's version
  require "omniauth/openid/version"

  # Configure version before loading the rest of the library
  OmniAuth::OpenID::Version.class_eval do
    extend VersionGem::Basic
  end

  warn "[DEPRECATION][omniauth-openid v2] Change `require 'omniauth-openid/version'` to `require 'omniauth/openid/version'`. Support for `require 'omniauth-openid/version'` will be removed in v3."
end
# :nocov:
