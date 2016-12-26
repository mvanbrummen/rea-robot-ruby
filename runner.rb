class Runner
  attr_reader :is_running

  PROMPT = "> "
  USAGE_STATEMENT = "Valid commands: PLACE x,y,(NORTH|EAST|SOUTH|WEST), MOVE, LEFT, RIGHT, REPORT, QUIT"

  def initialize(robot)
    @robot = robot
    @is_running = true
  end

  def parse_command(cmd)
    case cmd
    when /^PLACE \d+\,\d+\,(NORTH|EAST|SOUTH|WEST)$/
      tokens = cmd.sub("PLACE ", "").split(',')
      @robot.place(tokens[0].to_i, tokens[1].to_i, tokens[2].downcase.to_sym)
    when "MOVE"
      @robot.move
    when "LEFT"
      @robot.rotate_left
    when "RIGHT"
      @robot.rotate_right
    when "REPORT"
      print @robot.report
    when "QUIT"
      @is_running = false
    else
      # whachu talkin 'bout Willis?
      puts USAGE_STATEMENT
    end
  end
end
