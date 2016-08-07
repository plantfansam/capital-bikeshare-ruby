module CapitalBikeshare
  class StationSet
		def initialize(stations = [])
		  @stations = stations
		end

		def to_a
		  @stations.to_a
		end

		def find(searchable)
			case searchable
			when String
				return find_by_name(searchable)
			when Fixnum
				return find_by_id(searchable)
			end
		end

		def find_by_name(name)
			@stations.select do |station|
				next unless station.name
				station.name.downcase == name.downcase
			end.first
		end

		def find_by_id(num)
			@stations.select{ |station| station.id == num }.first
		end
  end
end
