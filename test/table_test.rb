require_relative "../table"
require_relative "../point"
require "test/unit"

class TableTest < Test::Unit::TestCase
  def test_initialize
    assert_nothing_raised {Table.new(Point.new(0, 0), Point.new(4, 4))}
    assert_raise ArgumentError do
      Table.new(Point.new(2, 2), Point.new(1, 1))
    end
    assert_raise ArgumentError do
      Table.new(Point.new(1, 2), Point.new(1, 1))
    end
    assert_raise ArgumentError do
      Table.new(Point.new(2, 1), Point.new(1, 1))
    end
    assert_raise ArgumentError do
      Table.new(Point.new(222, 222), Point.new(1, 1))
    end
    assert_raise ArgumentError do
      Table.new(Point.new(-111, -324), Point.new(-1000, -1000))
    end
  end

  def test_within_bounds
    table = Table.new(Point.new(0, 0), Point.new(4, 4))
    assert(table.within_bounds? Point.new(0, 0))
    assert(table.within_bounds? Point.new(4, 4))
    assert(table.within_bounds? Point.new(0, 2))
    assert(table.within_bounds? Point.new(2, 4))
    assert(!(table.within_bounds? Point.new(-1, 0)))
    assert(!(table.within_bounds? Point.new(0, 5)))
    assert(!(table.within_bounds? Point.new(-1322, -242)))
    assert(!(table.within_bounds? Point.new(43232, 342)))
  end
end
