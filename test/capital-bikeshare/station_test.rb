require_relative "../test_helper"
require "minitest/autorun"

class TestCapitalBikeshareStation < Minitest::Test
  def setup
    @station = ::CapitalBikeshare::Station.new
  end

  def test_attr_accessors
    ::CapitalBikeshare::Station::XML_FIELDS.each do |field|
      assert_equal @station.respond_to?(field), true
    end
  end
end