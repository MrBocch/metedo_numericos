require "cli-table"

def func(x)
    # return 4.0*(x**2.0) - 6.0*x
    return 4.0 * Math.exp(4.0*x)
    # return x**3.0 + 2.0*(x**2.0) + 10.0*x - 20.0
end

def d_func(x)
    # return 8.0*x - 6.0
    return 16.0 * Math.exp(4.0*x)
    # return 3.0*(x**2.0) + 4.0*x + 10.0
end

puts "
    fx = 4x^2 - 6x
    "

puts ("
    4e^(4x)
    ")

t = Table.new ["i", "xn", "error_x"]
i = 0
xi = 1
t.rows << [i, xi, nil]
(0..10).each do
    i += 1
    xn = xi - (func(xi)/ d_func(xi))
    error = (xn - xi).abs
    t.rows << [i, xn, error]

    if error <= 0.0001 then break end
    xi  = xn
end
t.show
