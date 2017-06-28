Gem::Specification.new do |spec|
  spec.name        = 'w3c_datetime'
  spec.version     = '0.0.4'
  spec.summary     = "Deal with date and time in w3c format"
  spec.authors     = ["Michal Pawlowski"]
  spec.email       = 'misza@misza.co.uk'

  spec.files       = ["lib/w3c_datetime.rb", "lib/time.rb", "lib/w3c_datetime/w3c_datetime.rb"]
  spec.require_paths = ["lib"]

  spec.homepage    = 'https://github.com/itsudo/w3c_datetime'
  spec.license     = 'MIT'

  spec.required_ruby_version = '>=1.9.2'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
end
