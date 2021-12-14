# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  triangle_sides = [a, b, c]

  # if the side lengths are either 0 or negative, throw an exception
  raise TriangleError if triangle_sides.min <= 0
  #  sort is a Ruby enumerator that compares two elements in an array at a time.
  a, b, c = triangle_sides.sort
  raise TriangleError if a + b <= c

  # if the max and min of the array are the same,
  if (triangle_sides.max == triangle_sides.min)
    return :equilateral
  end

  # if there are 2 unique values in the array
  if (triangle_sides.uniq.length == 2)
    return :isosceles
  end

  # if there is 3 unique values in the array
  if (triangle_sides.uniq.length == 3)
    return :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
