require 'rubygems'

Gem::Specification.new do |spec|
  spec.name       = 'final'
  spec.version    = '0.3.1'
  spec.license    = 'Apache-2.0'
  spec.author     = 'Daniel J. Berger'
  spec.email      = 'djberg96@gmail.com'
  spec.homepage   = 'https://github.com/djberg96/final'
  spec.summary    = "An implementation of 'final' for Ruby"
  spec.test_files = Dir['spec/*_spec.rb']
  spec.files      = Dir['**/*'].reject{ |f| f.include?('git') }
  spec.cert_chain = Dir['certs/*']

  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec', '~> 3.9')

  spec.metadata = {
    'homepage_uri'          => 'https://github.com/djberg96/final',
    'bug_tracker_uri'       => 'https://github.com/djberg96/final/issues',
    'changelog_uri'         => 'https://github.com/djberg96/final/blob/main/CHANGES.md',
    'documentation_uri'     => 'https://github.com/djberg96/final/wiki',
    'source_code_uri'       => 'https://github.com/djberg96/final',
    'wiki_uri'              => 'https://github.com/djberg96/final/wiki',
    'rubygems_mfa_required' => 'true'
  }

  spec.description = <<-EOF
    The final library enables you to declare your classes as final. This
    prevents your class from being subclassed or having its methods redefined.
  EOF
end
