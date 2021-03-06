# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'port_forwarding/version'

Gem::Specification.new do |spec|
  spec.name          = "port_forwarding"
  spec.version       = PortForwarding::VERSION
  spec.authors       = ["Mircea Samuila"]
  spec.email         = ["mrcc87@gmail.com"]

  spec.summary       = %q{This gem does port forwarding to many servers.}
  spec.description   = %q{This gem does port forwarding to many servers.}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "net-ssh", "~> 3.1"
  spec.add_dependency "artii", "~> 2.1"
  spec.add_dependency "colorize", "~> 0.7"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.1"
end
