require File.join(__FILE__, "../lib/capital-bikeshare/version")

Gem::Specification.new do |s|
  s.name        = 'capital-bikeshare'
  s.version     = CapitalBikeshare::VERSION
  s.date        = '2016-07-04'
  s.summary     = "Wrapper for Capital Bikeshare station data"
  s.description = "Get data about station status etc"
  s.authors     = ["llleafyyy"]
  s.email       = "llleafyyy@gmail.com"
  s.files       = ["lib/capital-bikeshare.rb",
                    "lib/capital_bikeshare/client.rb",
                    "lib/capital_bikeshare/helpers.rb",
                    "lib/capital_bikeshare/station.rb",
                    "lib/capital_bikeshare/station_set.rb"]
  s.homepage    = 'http://rubygems.org/gems/capital-bikeshare'
  s.license     = 'MIT'
end
