require_relative "../test_helper"
require "minitest/autorun"

class TestCapitalBikeshareClient < Minitest::Test
  FEED_XML = File.open(
    File.expand_path(
      File.join(
        File.dirname(__FILE__), "../fixtures/station_feed.xml"))).read

  def setup
    @client = ::CapitalBikeshare.client
  end

  def test_fetch
    Net::HTTP.stub :get, FEED_XML do
      @client.fetch
      assert_equal @client.instance_variable_get("@station_data"),
        FEED_XML
    end
  end

  def test_parse_station_data
    Net::HTTP.stub :get, FEED_XML do
      @client.fetch
    end

    station = @client.stations.first

    # Make sure integer fields are integers
    CapitalBikeshare::Station::INTEGER_FIELDS.each do |field|
      field_accessor = Helpers.to_snake_case(field.to_s)
      assert_equal station.send(field_accessor).class, Fixnum
    end

    # Make sure datetime fields are datetimes
    CapitalBikeshare::Station::DATETIME_FIELDS.each do |field|
      field_accessor = Helpers.to_snake_case(field.to_s)
      assert [DateTime, NilClass].include?(station.send(field_accessor).class)
    end

    # Make sure boolean fields are booleans
    CapitalBikeshare::Station::BOOLEAN_FIELDS.each do |field|
      field_accessor = Helpers.to_snake_case(field.to_s)
      field_value = station.send(field_accessor)
      assert [true, false].include?(field_value).class
    end

    # Make sure boolean fields are booleans
    CapitalBikeshare::Station::FLOAT_FIELDS.each do |field|
      field_accessor = Helpers.to_snake_case(field.to_s)
      assert_equal station.send(field_accessor).class, Float
    end

    # Make sure string fields are strings
    CapitalBikeshare::Station::STRING_FIELDS.each do |field|
      field_accessor = Helpers.to_snake_case(field.to_s)
      assert_equal station.send(field_accessor).class, String
    end
  end
end
