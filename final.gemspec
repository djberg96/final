require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'final'
  spec.version    = '0.2.1'
  spec.license    = 'Apache-2.0'
  spec.author     = 'Daniel J. Berger'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'https://github.com/djberg96/final'
  spec.summary    = "An implementation of 'final' for Ruby"
  spec.test_files = Dir['test/test*']
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.cert_chain = Dir['certs/*']

  spec.extra_rdoc_files  = ['README', 'CHANGES', 'MANIFEST']

  spec.metadata = {
    'homepage_uri'      => 'https://github.com/djberg96/final',
    'bug_tracker_uri'   => 'https://github.com/djberg96/final/issues',
    'changelog_uri'     => 'https://github.com/djberg96/final/blob/master/CHANGES',
    'documentation_uri' => 'https://github.com/djberg96/final/wiki',
    'source_code_uri'   => 'https://github.com/djberg96/final',
    'wiki_uri'          => 'https://github.com/djberg96/final/wiki'
  }

  spec.description = <<-EOF
    The final library enables you to declare your classes as final. This
    prevents your class from being subclassed or having its methods redefined.
  EOF

  spec.add_development_dependency('rake')
  spec.add_development_dependency('test-unit', '>= 2.2.0')
end
