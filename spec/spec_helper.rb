# Std Libs
require "securerandom"

# Bugfixes
# JRuby needed an explicit "require 'logger'" for Rails < 7.1
# See: https://github.com/rails/rails/issues/54260#issuecomment-2594650047
# Placing above omniauth because it is a dependency of omniauth,
#   which is undeclared in older versions.
require "logger"

# External library dependencies
require "rack/test"
require "rack/session"
require "rack/openid"
require "webmock/rspec"
require "version_gem/ruby"

require "omniauth"
require "omniauth/version"

# RSpec Configs
require "config/omniauth"
require "config/rspec/rack_test"
require "config/rspec/rspec_block_is_expected"
require "config/rspec/rspec_core"
require "config/rspec/version_gem"

# RSpec Support
spec_root_matcher = %r{#{__dir__}/(.+)\.rb\Z}
Dir.glob(Pathname.new(__dir__).join("support/**/", "*.rb")).each { |f| require f.match(spec_root_matcher)[1] }

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
end

if OmniAuth.config.respond_to?(:request_validation_phase)
  OmniAuth.config.request_validation_phase = ->(env) {}
end

# The last thing before loading this gem is to set up code coverage
begin
  # This does not require "simplecov", but
  require "kettle-soup-cover"
  #   this next line has a side effect of running `.simplecov`
  require "simplecov" if defined?(Kettle::Soup::Cover) && Kettle::Soup::Cover::DO_COV
rescue LoadError => error
  # check the error message and conditionally re-raise
  raise error unless error.message.include?("kettle")
end

# This gem
require "omniauth-openid"
