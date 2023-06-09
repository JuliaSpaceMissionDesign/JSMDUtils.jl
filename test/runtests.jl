using JSMDUtils
using Test

using LazyArtifacts

import JSMDInterfaces.Ephemeris as jEphem

@testset "Download all artifacts" begin
    @info artifact"testdata"
    @info "All artifacts downloaded"
end

@testset "JSMDUtils" verbose = true begin
    @eval begin
        modules = [:Math]
        for m in modules
            @testset "$m" verbose = true begin
                include("$m/$m.jl")
            end
        end
    end

    include("ephemeris.jl")
    include("format.jl")
    include("FileUtils.jl")
end;
