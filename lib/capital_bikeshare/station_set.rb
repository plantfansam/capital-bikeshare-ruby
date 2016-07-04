module CapitalBikeshare
  class StationSet
    def initialize(stations = [])
      @stations = stations
    end

    def to_a
      @stations.to_a
    end
  end
end
