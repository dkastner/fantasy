# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "faraday_io-core"
  spec.version       = "0.0.0"
  spec.authors       = ["Derek Kastner"]
  spec.email         = ["dkastner@gmail.com"]
  spec.summary       = %q{Fantasy}
  spec.description   = %q{Fantasy baseball}
  spec.license       = "MIT"
  spec.required_rubygems_version = '>=2.1'
  spec.files         = Dir['*.gemspec'] + Dir['*.md'] +
    ['Gemfile'] + Dir['lib/**/*.rb'] + Dir['spec/**/*.rb']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'data_mapper'
  spec.add_runtime_dependency 'dm-postgres-adapter'
  spec.add_runtime_dependency 'pasqual'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
