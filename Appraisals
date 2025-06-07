# frozen_string_literal: true

# HOW TO UPDATE APPRAISALS:
#   BUNDLE_GEMFILE=Appraisal.root.gemfile bundle
#   BUNDLE_GEMFILE=Appraisal.root.gemfile bundle exec appraisal update
#   bundle exec rake rubocop_gradual:autocorrect

# Used for HEAD (nightly) releases of ruby, truffleruby, and jruby.
# Split into discrete appraisals if one of them needs a dependency locked discretely.
appraise "dep-heads" do
  eval_gemfile "modular/runtime_heads.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Test Matrix:
#   - Ruby 2.4
appraise "omniauth-v1.1-r2.4" do
  eval_gemfile "modular/omniauth/r2/v1.1.gemfile"
  eval_gemfile "modular/x_std_libs/r2.4/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Test Matrix:
#   - Ruby 2.5
#   - Ruby 2.6
#   - Ruby 2.7
appraise "omniauth-v1.2-r2" do
  eval_gemfile "modular/omniauth/r2/v1.2.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.5
#   - Ruby 2.6
#   - Ruby 2.7
appraise "omniauth-v1.3-r2" do
  eval_gemfile "modular/omniauth/r2/v1.3.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.5
#   - Ruby 2.6
#   - Ruby 2.7
appraise "omniauth-v1.4-r2" do
  eval_gemfile "modular/omniauth/r2/v1.4.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.5
#   - Ruby 2.6
#   - Ruby 2.7
appraise "omniauth-v1.5-r2" do
  eval_gemfile "modular/omniauth/r2/v1.5.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.5
#   - Ruby 2.6
#   - Ruby 2.7
appraise "omniauth-v1.6-r2" do
  eval_gemfile "modular/omniauth/r2/v1.6.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.5
#   - Ruby 2.6
#   - Ruby 2.7
appraise "omniauth-v1.7-r2" do
  eval_gemfile "modular/omniauth/r2/v1.7.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.5
#   - Ruby 2.6
#   - Ruby 2.7
appraise "omniauth-v1.8-r2" do
  eval_gemfile "modular/omniauth/r2/v1.8.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.5
#   - JRuby 9.2
#   - Ruby 2.6
#   - JRuby 9.3
#   - Ruby 2.7
appraise "omniauth-v1.9-r2" do
  eval_gemfile "modular/omniauth/r2/v1.9.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 2.5
#   - JRuby 9.2
#   - Ruby 2.6
#   - JRuby 9.3
#   - Ruby 2.7
appraise "omniauth-v2.0-r2" do
  eval_gemfile "modular/omniauth/r2/v2.0.gemfile"
  eval_gemfile "modular/x_std_libs/r2/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 2.5
# Test Matrix:
#   - Ruby 3.0
appraise "omniauth-v2.1-r3.0" do
  eval_gemfile "modular/omniauth/r3/v2.1.gemfile"
  eval_gemfile "modular/x_std_libs/r3/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Compat: Ruby >= 3.1
# Test Matrix:
#   - Ruby 3.1
#   - JRuby 9.4
#   - Ruby 3.2
#   - Ruby 3.3
#   - JRuby 10.0
#   - jruby-head
appraise "omniauth-v2.1-r3" do
  eval_gemfile "modular/omniauth/r3/v2.1.gemfile"
  eval_gemfile "modular/x_std_libs/r3/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Only run security audit on the latest version of Ruby
appraise "audit" do
  eval_gemfile "modular/omniauth/r3/v2.1.gemfile"
  eval_gemfile "modular/audit.gemfile"
  eval_gemfile "modular/x_std_libs/r3/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Only run coverage on the latest version of Ruby
appraise "coverage" do
  eval_gemfile "modular/omniauth/r3/v2.1.gemfile"
  eval_gemfile "modular/coverage.gemfile"
  gem "ostruct", "~> 0.6", ">= 0.6.1" # Ruby >= 2.5
  eval_gemfile "modular/x_std_libs/r3/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end

# Only run linter on the latest version of Ruby (but, in support of the oldest supported Ruby version)
appraise "style" do
  eval_gemfile "modular/style.gemfile"
  eval_gemfile "modular/omniauth/r3/v2.1.gemfile"
  eval_gemfile "modular/x_std_libs/r3/libs.gemfile"
  remove_gem "appraisal" # only present because it must be in the gemfile because we target a git branch
end
