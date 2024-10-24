require "cli-table"

def func(x)
    # return 4.0*(x**2.0) - 6.0*x
    # return Math.exp(-x) - x
    return 4.0 * Math.exp(4.0*x)
    # return x**3.0 + 2.0*(x**2.0) + 10.0*x - 20.0
end

puts "
    fx = 4x^2 - 6x
    "

puts ("
    4e^(4x)
    ")

t = Table.new ["i", "xn", "error_x"]
# t.rows << [0, 0, nil]
# t.rows << [1, 1, 1]
x_i1 = 0.0
x_i2 = 1.0
i = 2
t.rows << [0, x_i1, nil]
t.rows << [1, x_i2, (x_i2 - x_i1).abs]

# sometimes you have to change wer to start
# x_i1 = 0.0
# x_i2 = 1.0

(0..20).each do

    xn = x_i2 - (func(x_i2) * (x_i2 - x_i1)) / (func(x_i2) - func(x_i1))

    error = (xn - x_i2).abs
    #if error <= 0.0001 then break end
    t.rows << [i, xn, error]

    x_i1 = x_i2
    x_i2 = xn
    i += 1
end
t.show
