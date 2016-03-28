source "https://rubygems.org"

group :test do
  gem "json"
  gem "rake", "~> 10.5.0" 
  gem "puppet", ENV['PUPPET_VERSION'] || '~> 3.7.0'
  gem "rspec"
  gem "rspec-core"
  gem "rspec-puppet", "~> 2.1"
  gem "puppetlabs_spec_helper"
  gem "metadata-json-lint"
  gem "puppet-syntax"
end

group :development do
  gem "travis"
  gem "travis-lint"
  gem "vagrant-wrapper"
  gem "puppet-blacksmith"
  gem "guard-rake"
end

group :system_tests do
  gem "beaker"
end
