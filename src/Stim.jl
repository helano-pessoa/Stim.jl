module Stim

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
    @variable(model, x[1:length(profits)], Bin)
    @constraint(model, sum(weights[i]*x[i] for i=1:length(profits)) <= cap)
    @objective(model, Max, sum(profits[i]*x[i] for i=1:length(profits)))
    optimize!(model)
    
    return model, objective_value(model), value.(x)
end

export dantzig_relaxation

function dantzig_relaxation(weights, profits, capacty)
    density = [p/w for (p,w) in zip(profits, weights)]
    sorted_density = reverse(sortperm(density))

    aux_capacity = 0
    x = zeros(length(profits))
    for d in sorted_density
        if (weights[d] + aux_capacity) <= capacity
            x[d] = 1
            aux_capacity += weights[d]
        else
            x[d] = (capacity - aux_capacity) / weights[d]
        end
    end

    objective_value = dot(x, profits)

    return objective_value, x
end

end # module
