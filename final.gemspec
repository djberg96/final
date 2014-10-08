require 'rubygems'

Gem::Specification.new do |gem|
  gem.name       = 'final'
  gem.version    = '0.1.1'
  gem.license    = 'Artistic 2.0'
  gem.author     = 'Daniel J. Berger'
  gem.email      = 'djberg96@gmail.com'
  gem.homepage   = 'https://github.com/djberg96/final'
  gem.summary    = "An implementation of 'final' for Ruby"
  gem.test_files = Dir['test/test*']
  gem.files      = Dir['**/*'].reject{ |f| f.include?('git') }

  gem.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']

  gem.description = <<-EOF
    The final library enables you to declare your classes as final. This
    prevents your class from being subclassed or having its methods redefined.
  EOF

  gem.add_development_dependency('rake')
  gem.add_development_dependency('test-unit', '>= 2.2.0')
end
