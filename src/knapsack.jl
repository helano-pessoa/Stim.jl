using JuMP, Cbc

export knapsack

"""
    model, obj_value, x = knapsack(weights, profits, capacity)

Returns model, objective value and variable vector to the knapsack problem given weights, profits
and capacity parameters.

Mathematical Model:

``I``

``Min ∑ profits(i).x(i)``

``i=1``

``St:``

   ``I``
   
   ``∑ weights(i).x(i) ⩽ capacity         ∀ i 𝞊 I``
   
``i=1``

``x(i) ⩾ 0                                ∀ i 𝟄 I``

"""
function knapsack(weights, profits, cap)
    model = Model(Cbc.Optimizer)
    I = eachindex(profits)
    @variable(model, x[I], Bin)
    @constraint(model, sum(weights[i] * x[i] for i in I) <= cap)
    @objective(model, Max, sum(profits[i] * x[i] for i in I))
    optimize!(model)
    
    return model, objective_value(model), value.(x)
end