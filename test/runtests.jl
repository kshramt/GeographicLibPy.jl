import Base.Test: @test, @test_throws

unshift!(LOAD_PATH, joinpath(dirname(@__FILE__), "..", "src"))
import GeographicLibPy


let
    ret = GeographicLibPy.inverse(10, 20, 30, 40)
    @test isapprox(ret["a12"], 27.35053124404891)
    @test isapprox(ret["azi1"], 40.319640222045905)
    @test isapprox(ret["azi2"], 47.328994793150066)
    @test isapprox(ret["lat1"], 10)
    @test isapprox(ret["lat2"], 30)
    @test isapprox(ret["lon1"], 20.0)
    @test isapprox(ret["lon2"], 40.0)
    @test isapprox(ret["s12"], 3035728.956905633)
end
