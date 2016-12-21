require_relative "point"

class Robot
  attr_reader :position, :direction, :surface

  def initialize(surface)
    @surface = surface
    @position = nil
    @direction = nil
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

  def rotate_left
    if is_placed?
      case @direction
      when :north
        @direction = :west
      when :east
        @direction = :north
      when :south
        @direction = :east
      when :west
        @direction = :south
      end
    end
  end

  def rotate_right
    if is_placed?
      case @direction
      when :north
        @direction = :east
      when :east
        @direction = :south
      when :south
        @direction = :west
      when :west
        @direction = :north
      end
    end
  end

  def report
    "#{@position},#{@direction.to_s.upcase}\n" if is_placed?
  end
end
