require "rubygems"
gem "mocha"
require "test/unit"
require "mocha/test_unit"
require_relative "../runner"
require_relative "../robot"

class RunnerTest < Test::Unit::TestCase
  def test_initialize
    assert Runner.new(Robot.new(nil)).is_running
  end
end
