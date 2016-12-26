class Table
  def initialize(min_point, max_point)
    raise ArgumentError, "Min point can't be more than max point" if min_point > max_point
    @min_point = min_point
    @max_point = max_point
  end

  def within_bounds?(point)
    Range.new(@min_point.x, @max_point.x) === point.x && Range.new(@min_point.y, @max_point.y) === point.y
  end
end
