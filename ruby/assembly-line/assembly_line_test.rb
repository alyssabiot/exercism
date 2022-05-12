require 'minitest/autorun'
require_relative 'assembly_line'

class AssemblyLineTest < Minitest::Test
  def test_production_rate_per_hour_for_speed_one
    assert_equal 221.0, AssemblyLine.new(1).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_two
    # skip
    assert_equal 442.0, AssemblyLine.new(2).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_three
    # skip
    assert_equal 663.0, AssemblyLine.new(3).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_four
    # skip
    assert_equal 884.0, AssemblyLine.new(4).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_five
    # skip
    assert_equal 994.5, AssemblyLine.new(5).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_six
    # skip
    assert_equal 1193.4, AssemblyLine.new(6).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_seven
    # skip
    assert_equal 1392.3, AssemblyLine.new(7).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_eight
    # skip
    assert_equal 1591.2, AssemblyLine.new(8).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_nine
    # skip
    assert_equal 1591.2, AssemblyLine.new(9).production_rate_per_hour
  end

  def test_production_rate_per_hour_for_speed_ten
    # skip
    assert_equal 1701.7, AssemblyLine.new(10).production_rate_per_hour
  end

  def test_working_items_per_minute_for_speed_one
    # skip
    assert_equal 3, AssemblyLine.new(1).working_items_per_minute
  end

  def test_working_items_per_minute_for_speed_five
    # skip
    assert_equal 16, AssemblyLine.new(5).working_items_per_minute
  end

  def test_working_items_per_minute_for_speed_eight
    # skip
    assert_equal 26, AssemblyLine.new(8).working_items_per_minute
  end

  def test_working_items_per_minute_for_speed_nine
    # skip
    assert_equal 26, AssemblyLine.new(9).working_items_per_minute
  end

  def test_working_items_per_minute_for_speed_ten
    # skip
    assert_equal 28, AssemblyLine.new(10).working_items_per_minute
  end
end
