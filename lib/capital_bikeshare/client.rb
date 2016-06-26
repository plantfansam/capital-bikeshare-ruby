module CapitalBikeshare
  class Client
    require "net/http"
    require "rexml/document"

    XML_FEED_URL =
      "https://www.capitalbikeshare.com/data/stations/bikeStations.xml"

    def initialize(xml_feed_url = XML_FEED_URL)
      @xml_feed_url = xml_feed_url
      @station_data = nil
      @station_set = StationSet.new
    end

    def fetch
      @station_data = Net::HTTP.get(URI(@xml_feed_url))
      parse_station_data(@station_data)
    end

    def parse_station_data(station_data)
      document = REXML::Document.new(station_data)
      document.elements.first.elements.each do |station_element|
        station_object = Station.new
        station_element.elements.each do |attr_element|
          station_object.send(
            "#{attr_element.name}=",
            attr_element.get_text)
        end

        @station_set.add(station_object)
      end
    end

    def stations
      @station_set
    end
  end
end