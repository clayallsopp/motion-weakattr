# -*- encoding: utf-8 -*-
VERSION = "0.1"

Gem::Specification.new do |spec|
  spec.name          = "motion-weakattr"
  spec.version       = VERSION
  spec.authors       = ["Clay Allsopp"]
  spec.email         = ["clay@usepropeller.com"]
  spec.description   = "weak_attr for WeakRefs in RubyMotion"
  spec.summary       = "weak_attr for WeakRefs in RubyMotion"
  spec.homepage      = "http://github.com/usepropeller/motion-weakattr"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
