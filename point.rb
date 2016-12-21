class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def translate(dx, dy)
    Point.new(@x + dx, @y + dy)
  end

  def to_s
    "#{@x},#{@y}"
  end

  def ==(other)
    return false if other == nil
    x == other.x && y == other.y
  end
end
