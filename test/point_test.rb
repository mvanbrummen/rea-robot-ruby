require_relative "../point"
require "test/unit"

class TestPoint < Test::Unit::TestCase

  def test_translate
    assert_equal(Point.new(0, 1), Point.new(0, 0).translate(0, 1))
    assert_equal(Point.new(1, 0), Point.new(0, 0).translate(1, 0))
    assert_equal(Point.new(0, -1), Point.new(0, 0).translate(0, -1))
    assert_equal(Point.new(-1, 0), Point.new(0, 0).translate(-1, 0))
    assert_equal(Point.new(55, 61), Point.new(5, 11).translate(50, 50))
  end

  def test_to_s
    assert_equal("0,0", Point.new(0, 0).to_s)
    assert_equal("-1,-1", Point.new(-1, -1).to_s)
  end

end
