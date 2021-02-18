using Stim, Test

function tests()
    weights = rand(1:10, 10)
    profits = rand(1:10, 10)
    capacity = 50
    @testset "knapsack_output" begin
        model, obj_value, x = knapsack(weights, profits, capacity)
        @test typeof(obj_value) == Int64
        @test length(x) == length(profits)
    end
    @testset "dantzig_relaxation_output" begin
        model, obj_value, x = dantzig_relaxation(weights, profits, capacity)
        @test typeof(obj_value) == Int64
        @test length(x) == length(profits)
    end
end


