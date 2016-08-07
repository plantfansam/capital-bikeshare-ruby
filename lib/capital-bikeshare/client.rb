module CapitalBikeshare
  class Client
    require "net/http"
    require "rexml/document"

    XML_FEED_URL =
      "https://feeds.capitalbikeshare.com/stations/stations.xml"

    def initialize(xml_feed_url = XML_FEED_URL)
      @xml_feed_url = xml_feed_url
      @station_data = nil
      @station_set = nil
    end

    def fetch
      @station_data = Net::HTTP.get(URI(@xml_feed_url))
      @station_set = StationSet.new(parsed_stations)
    end

    def station_xml_document
      REXML::Document.new(@station_data)
    end

    def parsed_stations
      station_elements = station_xml_document.elements.first.elements
      station_elements.map { |station| Station.new(station) }
    end

    def stations
      @station_set.to_a
    end

    def find(searchable)
      @station_set.find(searchable)
    end
  end
end