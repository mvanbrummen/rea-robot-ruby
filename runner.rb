#!/usr/bin/ruby

require_relative "robot"
require_relative "point"
require_relative "table"

PROMPT = "> "

@table = Table.new(Point.new(0, 0), Point.new(4, 4))
@robot = Robot.new(@table)
$is_running = true

def parse_command
  cmd = gets.chomp
  case cmd
  when /^PLACE \d+\,\d+\,(NORTH|EAST|SOUTH|WEST)$/
    cmd.sub!("PLACE", "")
    tokens = cmd.split(',')
    puts "#{tokens[0]} #{tokens[1]} #{tokens[2]}"
    @robot.place(tokens[0].to_i, tokens[1].to_i, parse_direction(tokens[2]))
  when "MOVE"
    @robot.move
  when "LEFT"
    @robot.rotate_left
  when "RIGHT"
    @robot.rotate_right
  when "REPORT"
    print @robot.report
  when "QUIT"
    $is_running = false
  else
    # whachu talkin 'bout Willis?
    puts "Valid commands: PLACE x,y,(NORTH|EAST|SOUTH|WEST), MOVE, LEFT, RIGHT, REPORT, QUIT"
  end
end

def parse_direction direction
  case direction
  when "NORTH"
    return :north
  when "EAST"
    return :east
  when "SOUTH"
    return :south
  when "WEST"
    return :west
  end
end

while $is_running do
  print PROMPT
  parse_command
end
