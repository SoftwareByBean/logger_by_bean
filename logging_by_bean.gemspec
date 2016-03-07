# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logging_by_bean/version'

Gem::Specification.new do |spec|
  spec.name          = "logging_by_bean"
  spec.version       = LoggingByBean::VERSION
  spec.authors       = ["David L Bean"]
  spec.email         = ["david.l.bean@mac.com"]

  spec.summary       = %q{Sets up better logging messages in Rails apps.}
  spec.description   = %q{Logging based on Beautiful logging for Ruby on Rails 4:  https://cbpowell.wordpress.com/2013/08/09/beautiful-logging-for-ruby-on-rails-4/}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
