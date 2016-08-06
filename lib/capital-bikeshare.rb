module CapitalBikeshare
  require_relative "capital-bikeshare/helpers"
  require_relative "capital-bikeshare/station"
  require_relative "capital-bikeshare/station_set"
  require_relative "capital-bikeshare/client"

  class << self
    attr_reader :client

    def initialize!
      @client = CapitalBikeshare::Client.new
      @client.fetch
      self
    end

    def method_missing(m, *args, &block)
      if @client.respond_to?(m)
        @client.send(m, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(m, include_private = false)
      @client.respond_to?(m, include_private) || super
    end

    CapitalBikeshare.initialize!
  end
end
