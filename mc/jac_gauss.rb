require "cli-table"

def fa(y, z)
    # return 4.0 + (2*y) - z
    return (4.0 + y - 4*z) / 3.0
    # return (7.85 + 0.1*y +0.2*z)/3.0
end

def fb(x, z)
    # return (2.0*x) - z
    return (5.0*x + 7.0*z)/ 3.0
    # return (-19.3 - 0.1*x + 0.3*z) / 7.0
end

def fc(x, y)
    # return (-5.0 + y + x) / 2.0
    return (-7.0*x + 4.0*y) / 4.0
    # return (71.4 - 0.3*x + 0.2*y) / 10.0
end


def jacobi
    jacobi_t = Table.new(["i", "x", "y", "z", "error_x", "error_y", "error_z"])
    i = 0
    x = 1
    y = 1
    z = 1
    jacobi_t.rows << [i, x, y, z, nil, nil, nil]
    (1..10).each do
        xn = fa(y, z)
        yn = fb(x, z)
        zn = fc(x, y)
        error_x = (xn - x).abs
        error_y = (yn - y).abs
        error_z = (zn - z).abs

        if error_x <= 0.0001 and error_y <= 0.0001 and error_z <= 0.0001 then
            break
        end
        i += 1
        x = xn
        y = yn
        z = zn
        jacobi_t.rows << [i, x, y, z, error_x, error_y, error_z]
    end
    jacobi_t.show
end

def gauss
    gauss_t = Table.new(["i", "x", "y", "z", "error_x", "error_y", "error_z"])
    i = 0
    x = 0
    y = 0
    z = 0
    gauss_t.rows << [i, x, y, z, nil, nil, nil]
    (1..10).each do
        xn = fa(y, z)
        yn = fb(xn, z)
        zn = fc(xn, yn)
        error_x = (xn - x).abs
        error_y = (yn - y).abs
        error_z = (zn - z).abs

        if error_x <= 0.0001 and error_y <= 0.0001 and error_z <= 0.0001 then
        #break
        end
        i += 1
        x = xn
        y = yn
        z = zn
        gauss_t.rows << [i, x, y, z, error_x, error_y, error_z]
    end
    gauss_t.show
end

# puts("
    # x - 2y + z = 4
    # 2x - y - z = 0
    # -x - y + 2z = -5
    # ")
puts ("
    3x - y + 4z = 4
    -5x +3y - 7z = 0
    7x - 4y + 4z = 0
    ")

puts("jacobi")
jacobi()
puts("gauss-seidal")
gauss()
