require "cli-table"

def fa(y, z)
    return (12.0 + y - 2*z)/5.0
end

def fb(x, z)
    return (-25.0 - 3*x + 2*z) / 8.0
end

def fc(x, y)
    return (6.0 - x - y) / 4.0
end


def jacobi
    jacobi_t = Table.new(["i", "x", "y", "z", "error_x", "error_y", "error_z"])
    i = 1
    x = 0
    y = 0
    z = 0
    jacobi_t.rows << [i, x, y, z, nil, nil, nil]
    (1..10).each do
        xn = fa(y, z)
        yn = fb(x, z)
        zn = fc(x, y)
        error_x = (xn - x).abs
        error_y = (yn - x).abs
        error_z = (zn - x).abs

        if error_x <= 0.001 and error_y <= 0.001 and error_z <= 0.001 then
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
    i = 1
    x = 0
    y = 0
    z = 0
    gauss_t.rows << [i, x, y, z, nil, nil, nil]
    (1..10).each do
        xn = fa(y, z)
        yn = fb(xn, z)
        zn = fc(xn, yn)
        error_x = (xn - x).abs
        error_y = (yn - x).abs
        error_z = (zn - x).abs

        if error_x <= 0.001 and error_y <= 0.001 and error_z <= 0.001 then
            break
        end
        i += 1
        x = xn
        y = yn
        z = zn
        gauss_t.rows << [i, x, y, z, error_x, error_y, error_z]
    end
    gauss_t.show
end



puts("jacobi")
jacobi()
