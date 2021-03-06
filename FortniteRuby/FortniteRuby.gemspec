lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'fortniteruby'
  spec.version       = '0.0.6'
  spec.authors       = ['xMistt']
  spec.summary       = 'Gem for interacting with Fortnite/Epic Games API.'
  spec.homepage      = 'https://github.com/xMistt/fortniteruby/'
    
  spec.files         = Dir['bin/*'] +
                       Dir['lib/**/*.rb']

  spec.require_paths = ['lib']


  spec.add_runtime_dependency 'httparty', '~> 0.17.1'
end
