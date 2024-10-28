#x = [1.9, 2.4, 3.8, 4.4]
#y = [2.5, 2.7, 3.7, 5]

x = [4.8, 5.1, 9.5, 10.0]
y = [3.7, 5.2, 6.0, 8.4]

xysum = 0
(0...x.length).each do |i|
  xysum += x[i] * y[i]
end

puts "sum of x: #{x.sum}"
puts "sum of y: #{y.sum}"
x2sum = x.map{|n| n**2}.sum
puts "sum of x^2: #{x2sum}"
puts "sum of x*y: #{xysum}"

puts "now solve this system of equations
  x1   x2   gx
  #{x.length} + #{x.sum} = #{y.sum}
  #{x.sum} + #{x2sum} = #{xysum}
"

def eq(x)
  # x1 = -0.216799
  # x2 = 1.181376
  x1 = 0.947017
  x2 = 0.664671
  return x1 + (x2 * x)
end

puts "x | g(x)"
(0...x.length).each do |i|
  puts "#{x[i]} | #{eq(x[i])}"
end
