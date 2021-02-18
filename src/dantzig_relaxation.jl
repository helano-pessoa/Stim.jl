using LinearAlgebra

export dantzig_relaxation

function dantzig_relaxation(weights, profits, capacity)
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
