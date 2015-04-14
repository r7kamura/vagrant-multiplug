lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant/multiplug/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-multiplug"
  spec.version       = Vagrant::Multiplug::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "Vagrant plug-in to manage plug-in dependencies."
  spec.homepage      = "https://github.com/r7kamura/vagrant-multiplug"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
end
