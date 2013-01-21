require 'rubygems'

spec = Gem::Specification.new do |s|
	s.name = 'instore_api'
	s.version = '0.0.1'
	s.summary = 'Client wrapper for the Instore API'
	s.description = 'Client wrapper for the Instore API. Exposes several endpoints that make it easy to utilize the API.'
	s.homepage = 'https://instoredoes.com/developer'
	s.files = Dir.glob("**/**/**")
	s.test_files = Dir.glob("test/*_test.rb")
	#s.autorequire = 'instore_api'
	s.author = 'Verdi Ergün'
	s.email  = 'v@instoredoes.com'
	s.has_rdoc = true
	s.required_ruby_version = '>= 1.9.1'
  	s.add_dependency "httparty", '~> 0.9.0'
    s.add_development_dependency("rspec")
    s.add_development_dependency("webmock")
    s.add_development_dependency("vcr")
    s.add_development_dependency("pry")
end