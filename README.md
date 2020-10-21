# NewtonsMethod

[![Build Status](https://travis-ci.com/loforteg/NewtonsMethod.jl.svg?branch=master)](https://travis-ci.com/loforteg/NewtonsMethod.jl)
[![Coverage](https://codecov.io/gh/loforteg/NewtonsMethod.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/loforteg/NewtonsMethod.jl)


-----
Here you can find a package containing two methods to perform the [Newton's Method](https://en.wikipedia.org/wiki/Newton's_method) to calculate the root of a univariate function.
The first method uses a fed-in first derivative, while the second one automatically computes the first derivative.

-----
### Documentation
The documentation of the package is:
1.  For the first method:
``` julia
newtonroot(f, df; iv = 0.3, tol = 1E-7, maxiter = 1000)
```

2. For the second method:
``` julia
newtonroot(f; iv = 0.3, tol = 1E-7, maxiter = 1000)
```

where
- `f(x)::Function` function whose root needs to be found;
- `df(x)::Function` first derivative of the function;
- `iv::Float64` initial value (`iv = 0.3` is the default);
- `tol::Float64` tolerance value (`tol = 1E-7` is the default);
- `maxiter::Int64` maximum number of iterations (`maxiter = 1000` is the default).



----
In the test section, you can see that I have broken a test on purpose in order to see what the Travis CI reports.
Evidence of the error has been screenshotted and it is now accessible in the file Evidence-error-PS5.png.
That test is now commented in order to have a nicely tested package.
