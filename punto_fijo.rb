require "cli-table"

def func(x)
    # return 4.0*(x**2.0) - 6.0*x
    # return Math.exp(-x) - x
    # return 4.0 * Math.exp(4.0*x)
    # return x**3.0 + 2.0*(x**2.0) + 10.0*x - 20.0
    # return Math.exp(-x)
    # return (4.0*(x**2.0)) / 6.0
    # return (2.0*(x**2)) / 3.0
    return 4.0*Math.exp(-x)
end

puts "
    fx = 4x^2 - 6x
    "

puts ("
    4e^(4x)
    ")

t = Table.new ["i", "xn", "error_x"]
i = 0
# x = 0
x = 1
error = nil

t.rows << [i, x, error]
i += 1
(0..22).each do
    xn = func(x)
    error = (xn - x).abs

    # if error <= 0.0000001 then break end
    t.rows << [i, xn, error]
    x = xn
    i += 1
end
t.show
