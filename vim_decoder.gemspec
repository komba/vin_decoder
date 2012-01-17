Gem::Specification.new do |s|
  s.name        = 'vin_decoder'
  s.version     = '0.2.0'
  s.date        = '2011-11-16'
  s.summary     = "VIN decoder that scrapes VIN information from websites"
  s.description = "VIN decoder that scrapes VIN information from websites"
  s.authors     = ["Josh Rendek", "Eugene Russkikh"]
  s.email       = 'josh@bluescripts.net'
  s.files       = ["lib/vin_decoder.rb"]
  s.homepage    =
    'https://github.com/komba/ruby_vin'

  s.add_runtime_dependency("hpricot")
end
