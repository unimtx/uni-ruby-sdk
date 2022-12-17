require_relative 'lib/uni-sdk/version'

Gem::Specification.new do |spec|
  spec.name          = 'uni-sdk'
  spec.version       = Uni::VERSION
  spec.authors       = ['Unimatrix']
  spec.email         = ['dev@unimtx.com']

  spec.summary       = 'Unimatrix Ruby SDK'
  spec.description   = 'The official Unimatrix SDK for Ruby, provides convenient access to integrate communication capabilities into your Ruby applications using the Unimatrix HTTP API. The SDK provides support for sending SMS, 2FA verification, and phone number lookup.'
  spec.homepage      = 'https://unimtx.com'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['documentation_uri'] = 'https://www.unimtx.com/docs'
  spec.metadata['source_code_uri'] = 'https://github.com/unimtx/uni-ruby-sdk'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.require_paths = ['lib']

  spec.add_dependency('faraday', '>= 2.7.0', '< 3.0')
end
