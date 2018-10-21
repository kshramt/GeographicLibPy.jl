using Test

using GeographicLibPy


@testset "direct" begin
    let ret = GeographicLibPy.direct(0, 0, 90, 1000*40000/360)
        @test isapprox(ret["a12"], 1.001485886025395)
        @test isapprox(ret["azi1"], 90)
        @test isapprox(ret["azi2"], 90)
        @test isapprox(ret["lat1"], 0)
        @test isapprox(ret["lon1"], 0)
        @test isapprox(ret["lat2"], 0)
        @test isapprox(ret["lon2"], 0.9981280934661352)
        @test isapprox(ret["s12"], 111111.11111111111)
    end
end


@testset "inverse" begin
    let ret = GeographicLibPy.inverse(10, 20, 30, 40)
        @test isapprox(ret["a12"], 27.35053124404891)
        @test isapprox(ret["azi1"], 40.319640222045905)
        @test isapprox(ret["azi2"], 47.328994793150066)
        @test isapprox(ret["lat1"], 10)
        @test isapprox(ret["lat2"], 30)
        @test isapprox(ret["lon1"], 20.0)
        @test isapprox(ret["lon2"], 40.0)
        @test isapprox(ret["s12"], 3035728.956905633)
    end
end
