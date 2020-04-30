require File.expand_path("../lib/capital-bikeshare/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'capital-bikeshare'
  s.version     = CapitalBikeshare::VERSION
  s.date        = '2016-07-04'
  s.summary     = "Wrapper for Capital Bikeshare station data"
  s.description = "Get data about station status etc"
  s.authors     = ["plantfansam"]
  s.email       = "sam.handler@gmail.com"
  s.files       = ["lib/capital-bikeshare.rb",
                    "lib/capital-bikeshare/client.rb",
                    "lib/capital-bikeshare/helpers.rb",
                    "lib/capital-bikeshare/station.rb",
                    "lib/capital-bikeshare/station_set.rb"]
  s.homepage    = 'http://rubygems.org/gems/capital-bikeshare'
  s.license     = 'MIT'
end
