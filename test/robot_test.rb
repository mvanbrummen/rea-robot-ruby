require_relative "../robot"
require "test/unit"

class MockTable
  def within_bounds?(point)
    true
  end
end

class RobotTest < Test::Unit::TestCase
  def test_is_placed_false
    assert_equal(false, Robot.new(nil).is_placed?)
  end

  def test_is_placed_true
    robot = Robot.new(MockTable.new)
    robot.place(0, 0, :north)
    assert_equal(true, robot.is_placed?)
  end

  def test_report_not_placed
    assert_equal(nil, Robot.new(nil).report)
  end

  def test_report_placed
    robot = Robot.new(MockTable.new)
    robot.place(0, 0, :north)
    assert_equal("0,0,NORTH\n", robot.report)
  end
end
