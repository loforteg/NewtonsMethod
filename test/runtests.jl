using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin

    # Define some functions to be tested

    # a. root = 1.0
    f(x) = (x - 1)^3
    df(x) = 3*(x - 1)^2

    # b. root = 0.6
    g(x) = (5*x - 3)^2
    dg(x) = 10*(5*x - 3)

    # c. no root (root = nothing)
    h(x) = 2 + x^2
    dh(x) = 2*x

    # 1. Test function f(x)
    @test NewtonsMethod.newtonroot(f, df)[1] ≈ 1.0
    @test NewtonsMethod.newtonroot(f)[1] ≈ 1.0

    # 2. Test function g(x)
    @test NewtonsMethod.newtonroot(g, dg)[1] ≈ 0.6
    @test NewtonsMethod.newtonroot(g)[1] ≈ 0.6

    # 3. Test using BigFloat precision instead of Float
    @test BigFloat(NewtonsMethod.newtonroot(f, df)[1]) ≈ 1.0
    @test BigFloat(NewtonsMethod.newtonroot(f)[1]) ≈ 1.0

    x0 = BigFloat(0.3)
    @test NewtonsMethod.newtonroot(f, df; iv = x0)[1] ≈ 1.0
    @test NewtonsMethod.newtonroot(f; iv = x0)[1] ≈ 1.0

    # 4. Test non-convergence of h(x)
    @test NewtonsMethod.newtonroot(h, dh)[1] === nothing
    @test NewtonsMethod.newtonroot(h)[1] === nothing

    # 5. Test maxiter
    # From PS1, root of f(x) found in ≈ 20 iterations
    @test NewtonsMethod.newtonroot(f, df; maxiter = 1)[1] === nothing
    @test NewtonsMethod.newtonroot(f; maxiter = 1)[1] === nothing
    @test NewtonsMethod.newtonroot(f, df; maxiter = 200)[1] ≈ 1.0
    @test NewtonsMethod.newtonroot(f; maxiter = 200)[1] ≈ 1.0

    # 6. Test tolerance
    @test !(NewtonsMethod.newtonroot(f, df; tol = 0.1)[1] ≈ 1.0)
    @test !(NewtonsMethod.newtonroot(f; tol = 0.1)[1] ≈ 1.0)

    # 7. Test initial value
    @test NewtonsMethod.newtonroot(f, df; iv = 0.5)[1] ≈ 1.0
    @test NewtonsMethod.newtonroot(f; iv = 0.5)[1] ≈ 1.0

    # 8. Break a test
    # @test NewtonsMethod.newtonroot(f, df)[1] ≈ 0.2
    # @test NewtonsMethod.newtonroot(f)[1] ≈ 0.2


end
