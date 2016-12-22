require_relative "point"

class Robot
  attr_reader :position, :direction, :surface
  RIGHT, LEFT = 1, -1

  def initialize(surface)
    @surface = surface
    @position = nil
    @direction = nil
    @@directions = [:north, :east, :south, :west]
  end

  def place(x, y, direction)
    new_position = Point.new(x, y)
    if surface.within_bounds? new_position
      @position = new_position
      @direction = direction
    end
  end

  def is_placed?
    @position != nil
  end

  def move
    if is_placed?
      dx, dy = 0, 0
      case @direction
      when :north
        dy = 1
      when :east
        dx = 1
      when :south
        dy = -1
      when :west
        dx = -1
      end
      new_position = @position.translate(dx, dy)
      @position = new_position if @surface.within_bounds? new_position
    end
  end

  def report
    "#{@position},#{@direction.to_s.upcase}\n" if is_placed?
  end

  def rotate_left
    rotate LEFT
  end

  def rotate_right
    rotate RIGHT
  end

  private
  def rotate index
    i = @@directions.index(@direction)
    @direction = @@directions[(i + index) % 4] if is_placed?
  end
end
