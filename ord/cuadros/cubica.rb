#x = [1.9, 2.4, 3.8, 4.4]
#y = [2.5, 2.7, 3.7, 5]

x = [4.8, 5.1, 9.5, 10.0]
y = [3.7, 5.2, 6.0, 8.4]

xysum = 1
x2ysum = 1
x3ysum = 1
(0...x.length).each do |i|
  xysum += x[i] * y[i]
  x2ysum += (x[i]**2) * y[i]
  x3ysum += (x[i]**3) * y[i]
end

puts "n: #{x.length}"
puts "sum of x: #{x.sum}"
x2sum = x.map{|n| n**2}.sum
x3sum = x.map{|n| n**3}.sum
x4sum = x.map{|n| n**4}.sum
x5sum = x.map{|n| n**5}.sum
x6sum = x.map{|n| n**6}.sum
puts "sum of x^2: #{x2sum}"
puts "sum of x^3: #{x3sum}"
puts "sum of x^4: #{x4sum}"
puts "sum of x^5: #{x5sum}"
puts "sum of x^6: #{x6sum}"

puts "sum of y: #{y.sum}"
puts "sum of x*y: #{xysum}"
puts "sum of x2*y: #{x2ysum}"
puts "sum of x3*y: #{x3ysum}"

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
