require "cli-table"

def get_x(a, b)
    return a - (func(a) * (b-a)) / (func(b) - func(a))
end

def func(z)
    # return 3.0*(z**3) - 2.0*z - 3
    # return 4.0*(z**2) - 6.0*z
    return
end


puts "
    fx = 4x^2 - 6x
    "

puts ("
    4e^(4x)
    ")

t = Table.new ["i", "a", "b", "x", "error_x"]
i = 1

a = 1
b = 2

x = nil
error = nil

t.rows << [i, a, b, x, error]
i += 1
(0..22).each do
    xn = get_x(a, b)
    if x != nil
        error = (xn - x).abs
    end

    # if error <= 0.0000001 then break end
    t.rows << [i, a, b, xn, error]
    a = xn
    x = xn
    i += 1
end
t.show
