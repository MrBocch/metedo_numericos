require "cli-table"

def f(x)
    return 4.0 ** Math.exp(4.0*x)
end

t = Table.new ["x", "f(x)"]

(-5..5).each do |x|
    t.rows << [x, f(x)]
end

t.show
