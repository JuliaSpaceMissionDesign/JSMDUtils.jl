module Math

using LinearAlgebra
using ForwardDiff: derivative, ForwardDiff
using StaticArrays

import JSMDInterfaces.Math as jMath

include("angles.jl")
include("derivatives.jl")

include(joinpath("Interpolation", "Interpolation.jl"))

end
