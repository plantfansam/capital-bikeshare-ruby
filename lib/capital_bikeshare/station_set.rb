module CapitalBikeshare
  class StationSet
    def initialize(stations = [])
      @stations = stations
    end

    def add(station)
      @stations.push(station)
    end
  end
end