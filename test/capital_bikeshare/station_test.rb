require_relative "../test_helper"
require "minitest/autorun"

class TestCapitalBikeshareStation < Minitest::Test
  def setup
    @station = ::CapitalBikeshare::Station.new
  end

  def test_attr_accessors
    accessors = ::CapitalBikeshare::Station::XML_FIELDS.map do |field|
      Helpers.to_snake_case(field.to_s)
    end

    accessors.each do |field|
      assert_equal @station.respond_to?(field), true
    end
  end

  def test_initialize_from_xml
    station_xml = File.open(
      File.expand_path(
        File.join(
          File.dirname(__FILE__), "../fixtures/station.xml"))).read

    station_attrs = {
      id: 1,
      name: "Eads St & 15th St S",
      terminal_name: 31000,
      last_comm_with_server: ::CapitalBikeshare::Station.coerce_to_datetime("1466958956173"),
      lat: 38.858662,
      long: -77.053199,
      installed: true,
      locked: false,
      install_date: ::CapitalBikeshare::Station.coerce_to_datetime(0),
      removal_date: ::CapitalBikeshare::Station.coerce_to_datetime(nil),
      temporary: false,
      public: true,
      nb_bikes: 3,
      nb_empty_docks: 11,
      latest_update_time: ::CapitalBikeshare::Station.coerce_to_datetime("1466958836383")
    }

    station_element = REXML::Document.new(station_xml).elements.first
    station = ::CapitalBikeshare::Station.new(station_element)

    station_attrs.each do |k, v|
      assert_equal station.send(k), v
    end
  end
end