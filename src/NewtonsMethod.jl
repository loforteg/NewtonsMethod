module NewtonsMethod

greet() = print("Hello! This function computes the Newton's Method; starting value is 0.3.")


using LinearAlgebra, ForwardDiff

# Function using f'
function newtonroot(f, g; iv = 0.3, tol = 1E-13, maxiter = 1000)

    x_old = iv
    normdiff = Inf
    iter = 1

    while normdiff > tol && iter <= maxiter

        # handle negative first derivative
        if !(g(x_old) == 0)
            x_new = x_old - f(x_old) / g(x_old)
            normdiff = norm(x_new - x_old)
            x_old = x_new
            iter = iter + 1
        else
            return (value = nothing, normdiff = nothing, iter = nothing)
        end

    end

    # handle non convergence
    if normdiff <= tol && iter <= maxiter
        return (value = x_old, normdiff = normdiff, iter = iter)
    else
        return (value = nothing, normdiff = nothing, iter = nothing)
    end

end


# Function using ForwardDiff
function newtonroot(f; iv = 0.3, tol = 1E-13, maxiter = 1000)

    x_old = iv
    normdiff = Inf
    iter = 1

    D(f) = x -> ForwardDiff.derivative(f,x)
    g = D(f)

    sol = newtonroot(f, g; iv = iv, tol = tol, maxiter = maxiter)

    return sol
end



export newtonroot


end
