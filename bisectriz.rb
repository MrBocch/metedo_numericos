require "cli-table"

def func(x)
    # return x**3.0 - (6.5*x) + 2.0
    # return 4*(x**2) - 6*x
    return 4.0* Math.exp(4.0*x)
end

def get_x(a, b)
    return (a + b) / 2.0
end

t = Table.new ["a", "b", "x", "f(x) comportamiento", "error"]

a = 0
b = 1
error = nil
old_x = nil

(0..20).each do
    x = get_x(a, b)
    if old_x == nil
        error = nil
    else
        error = (x - old_x).abs
    end

    comportamiento = func(x)
    if comportamiento.positive?
        comportamiento = "+"
    else
        comportamiento = "-"
    end

    t.rows << [a, b, x, comportamiento, error]

    if comportamiento == "+" then a = x else b = x end
    old_x = x
end

t.show
