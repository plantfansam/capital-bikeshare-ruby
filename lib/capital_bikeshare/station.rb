module CapitalBikeshare
  class Station
    XML_FIELDS = [
      :id,
      :name,
      :terminalName,
      :lastCommWithServer,
      :lat,
      :long,
      :installed,
      :locked,
      :installDate,
      :removalDate,
      :temporary,
      :public,
      :nbBikes,
      :nbEmptyDocks,
      :latestUpdateTime
    ]

    XML_FIELDS.each do |field|
      self.class_eval { attr_accessor field }
    end
  end
end