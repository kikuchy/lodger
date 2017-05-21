# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lodger/version'

Gem::Specification.new do |spec|
  spec.name          = "lodger"
  spec.version       = Lodger::VERSION
  spec.authors       = ["kikuchy"]
  spec.email         = ["kikuchy.h@gmail.com"]

  spec.summary       = "Retarget source files for testing from application target to testing target"
  spec.description   = "Lodger removes source files for testing (ex. FooTests.swift, BarMock.swift, BazStub.swift, etc) from main application target and add that files to main application target."
  spec.homepage      = "https://github.com/kikuchy/lodger"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = %w( README.md LICENSE ) + Dir['lib/**/*.rb']
  spec.bindir        = "bin"
  spec.executables   = %( lodger )
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "xcodeproj", "~> 1.4.2"
  spec.add_runtime_dependency "claide", "~> 1.0.1"
end
