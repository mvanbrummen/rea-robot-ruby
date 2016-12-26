#!/usr/bin/ruby

require_relative "robot"
require_relative "runner"
require_relative "point"
require_relative "table"

table = Table.new(Point.new(0, 0), Point.new(4, 4))
robot = Robot.new(table)
runner = Runner.new robot
while runner.is_running do
  print Runner::PROMPT
  runner.parse_command gets.chomp
end
