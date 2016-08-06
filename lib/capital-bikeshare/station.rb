module CapitalBikeshare
  class Station
    require "date"

    INTEGER_FIELDS = [:id, :nbBikes, :nbEmptyDocks, :terminalName]
    DATETIME_FIELDS = [:lastCommWithServer,
      :installDate, :removalDate, :latestUpdateTime]
    BOOLEAN_FIELDS = [:installed, :locked, :temporary, :public]
    FLOAT_FIELDS = [:lat, :long]
    STRING_FIELDS = [:name]

    XML_FIELDS =
      INTEGER_FIELDS +
      DATETIME_FIELDS +
      BOOLEAN_FIELDS +
      FLOAT_FIELDS +
      STRING_FIELDS

    XML_FIELDS.each do |field|
      attr_accessor Helpers.to_snake_case(field.to_s)
    end

    def initialize(station_attrs = nil)
      case station_attrs
      when REXML::Element
        initialize_from_xml(station_attrs)
      when Hash
        initialize_from_hash(station_attrs)
      end
    end

    def initialize_from_xml(station_xml)
      station_xml.elements.each do |attr_element|
        coerced_value = Station.coerce_field_value(
          attr_element.name.to_sym, attr_element.text)
        attribute_name = Helpers.to_snake_case(attr_element.name)
        send("#{attribute_name}=", coerced_value)
      end
      self
    end

    def initialize_from_hash(station_attrs)
      station_attrs.each { |key, value| send "#{key}=", value }
    end

    def self.coerce_field_value(field_name, field_value)
      case
      when INTEGER_FIELDS.include?(field_name)
        field_value.to_i
      when DATETIME_FIELDS.include?(field_name)
        coerce_to_datetime(field_value)
      when BOOLEAN_FIELDS.include?(field_name)
        field_value == "true"
      when FLOAT_FIELDS.include?(field_name)
        field_value.to_f
      when STRING_FIELDS.include?(field_name)
        field_value
      end
    end

    def self.coerce_to_datetime(field_value)
      return unless field_value && field_value.to_i > 0
      # sometimes there's more than 10 digits; need to figure out why
      unix_timestamp = field_value.slice(0..9)
      DateTime.strptime(unix_timestamp, "%s")
    end
  end
end
