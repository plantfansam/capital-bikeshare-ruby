require_relative "../test_helper"
require "minitest/autorun"

class TestCapitalBikeshareClient < Minitest::Test
  FEED_XML = File.open(
    File.expand_path(
      File.join(
        File.dirname(__FILE__), "../fixtures/station_feed.xml"))).read

  def setup
    @client = ::CapitalBikeshare::Client.new
  end

  def test_fetch
    Net::HTTP.stub :get, FEED_XML do
      @client.fetch
      assert_equal @client.instance_variable_get("@station_data"),
        FEED_XML
      assert_equal @client.instance_variable_get("@parsed_station_data"),
        @client.parse_station_data(FEED_XML)
    end
  end

  def test_parse_station_data

  end
end
