# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mrcr/helpers/version'

Gem::Specification.new do |spec|
  spec.name          = 'mrcr-helpers'
  spec.version       = Mrcr::Helpers::VERSION
  spec.authors       = ['Alexander Merkulov']
  spec.email         = ['sasha@merqlove.ru']

  spec.summary       = %q{Helpers for MRCR apps.}
  spec.description   = %q{Useful tools for redis, assets & so on.}
  spec.homepage      = 'https://github.com/merqlove/mrcr-helpers'
  spec.license       = 'MIT'
  
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 4.0'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
