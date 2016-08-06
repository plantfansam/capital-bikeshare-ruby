require_relative "../test_helper"
require "minitest/autorun"

class TestCapitalBikeshareStationSet < Minitest::Test
  def setup
    @station_1 = ::CapitalBikeshare::Station.new(id: 1)
    @station_2 = ::CapitalBikeshare::Station.new(id: 2)
    @station_foo = ::CapitalBikeshare::Station.new(name: "Foo")
    @station_bar = ::CapitalBikeshare::Station.new(name: "Bar")
  end

  def test_find_by_id
    station_set = ::CapitalBikeshare::StationSet.new(
      [@station_1, @station_2])
    found_station = station_set.find_by_id(1)
    assert_equal found_station.id, 1
    assert_equal station_set.find_by_id(4), nil
  end

  def test_find_by_name
    station_set = ::CapitalBikeshare::StationSet.new(
      [@station_foo, @station_bar])
    found_station = station_set.find_by_name("foo")
    assert_equal found_station.name, "Foo"
    assert_equal station_set.find_by_name("nerp"), nil
  end
end