using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin

    # 1. Test function f(x) = (x-1)^3 (done in PS1)
    f(x) = (x - 1)^3
    df(x) = 3*(x - 1)^2

    # test using the first derivative
    @test NewtonsMethod.newtonroot(f, df)[1] ≈ 1.0

    # test computing the first derivative with autodiff
    @test NewtonsMethod.newtonroot(f)[1] ≈ 1.0


    # 2. Test function f(x) = (5*x - 3)^2 (done in PS1)
    f(x) = (5*x - 3)^2
    df(x) = 10*(5*x - 3)

    # test using the first derivative
    @test NewtonsMethod.newtonroot(f, df)[1] ≈ 0.6

    # test with automatic differentiation
    @test NewtonsMethod.newtonroot(f)[1] ≈ 0.6


    # 3. Test using BigFloat precision instead of Float
    f(x) = (x - 1)^3
    df(x) = 3*(x - 1)^2

    @test BigFloat(NewtonsMethod.newtonroot(f, df)[1]) ≈ 1.0
    @test BigFloat(NewtonsMethod.newtonroot(f)[1]) ≈ 1.0


    # 4. Test non-convergence of f(x) = 2 + x^2
    f(x) = 2 + x^2
    df(x) = 2*x

    @test NewtonsMethod.newtonroot(f, df)[1] === nothing
    @test NewtonsMethod.newtonroot(f)[1] === nothing


    # 5. Test maxiter
    # From PS1, root of f(x) = (x-1)^3 found in ≈ 20 iterations
    f(x) = (x - 1)^3
    df(x) = 3*(x - 1)^2

    @test NewtonsMethod.newtonroot(f, df; maxiter = 1)[1] === nothing
    #@test NewtonsMethod.newtonroot(f; maxiter = 1)[1] === nothing

    @test NewtonsMethod.newtonroot(f, df; maxiter = 200)[1] ≈ 1.0
    @test NewtonsMethod.newtonroot(f; maxiter = 200)[1] ≈ 1.0


    # 6. Test tolerance
    # With a big tolerance, we cannot find the correct root
    # f(x) = (x - 1)^3
    # df(x) = 3*(x - 1)^2

    # @test !(NewtonsMethod.newtonroot(f, df; tol = 0.1)[1] ≈ 1.0)
    # @test !(NewtonsMethod.newtonroot(f; tol = 0.1)[1] ≈ 1.0)


    # 7. Test initial value
    # Recall default initial value is 0.3
    # f(X) = (x - 1)^3
    # df(x) = 3*(x - 1)^2

    # @test NewtonsMethod.newtonroot(f, df; iv = 0.5)[1] ≈ 1.0
    # @test NewtonsMethod.newtonroot(f; iv = 0.5)[1] ≈ 1.0


    # 8. Break a test
    # f(X) = (x - 1)^3
    # df(x) = 3*(x - 1)^2

    # @test NewtonsMethod.newtonroot(f, df)[1] ≈ 0.2
    # @test NewtonsMethod.newtonroot(f)[1] ≈ 0.2


end
