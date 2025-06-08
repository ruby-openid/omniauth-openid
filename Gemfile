#### IMPORTANT #######################################################
# Gemfile is for local development ONLY; Gemfile is NOT loaded in CI #
####################################################### IMPORTANT ####

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gemspec

### Std Lib Extracted Gems
eval_gemfile "gemfiles/modular/x_std_libs/r3/libs.gemfile"

### Security Audit
eval_gemfile "gemfiles/modular/audit.gemfile"

### Documentation
eval_gemfile "gemfiles/modular/documentation.gemfile"

### Linting
eval_gemfile "gemfiles/modular/style.gemfile"

# Code Coverage
eval_gemfile "gemfiles/modular/coverage.gemfile"

### Testing
gem "appraisal", github: "pboling/appraisal", branch: "galtzo"

# group :example do
#   gem 'sinatra'
# end
