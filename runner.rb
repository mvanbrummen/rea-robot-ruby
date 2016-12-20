#!/usr/bin/ruby

require_relative 'robot.rb'
require_relative 'point.rb'
require_relative 'table.rb'

PROMPT = "> "

@table = Table.new(Point.new(0, 0), Point.new(4, 4))
@robot = Robot.new(nil, nil, @table)

print PROMPT

def parse_command
  cmd = gets.chomp
  case cmd
  when /^PLACE \d+\,\d+\,(NORTH|EAST|SOUTH|WEST)$/
    cmd.sub! "PLACE" ""
    tokens = cmd.split(',')
    @robot.place(tokens[0], tokens[1], parse_direction(tokens[2]))
  when "MOVE"
    @robot.move
  when "LEFT"
    @robot.rotate_left
  when "RIGHT"
    @robot.rotate_right
  when "REPORT"
    @robot.report
  else
    # whachu talkin 'bout Willis?
    puts "Valid commands: PLACE x,y,(NORTH|EAST|SOUTH|WEST), MOVE, LEFT, RIGHT, REPORT, QUIT"
  end
end

def parse_direction direction
  case direction
  when "NORTH" return :north
  when "EAST" return :east
  when "SOUTH" return :south
  when "WEST" return :west
  end
end
