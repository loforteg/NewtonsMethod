module NewtonsMethod

greet() = print("Hello! This function computes the Newton's Method.")


using LinearAlgebra, ForwardDiff

# Function using f'
function newtonroot(f, g; iv, tol = 1E-7, maxiter = 1000)

    x_old = iv
    normdiff = Inf
    iter = 1

    while normdiff > tol && iter <= maxiter

        x_new = x_old - f(x_old) / g(x_old)
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end

    return (value = x_old, normdiff = normdiff, iter = iter)
end



# Function using ForwardDiff
function newtonroot2(f; iv, tol = 1E-7, maxiter = 1000)

    x_old = iv
    normdiff = Inf
    iter = 1

    D(f) = x -> ForwardDiff.derivative(f,x)
    g = D(f)

    sol = newtonroot(f, g; iv)

    return sol
end



export newtonroot2





end
