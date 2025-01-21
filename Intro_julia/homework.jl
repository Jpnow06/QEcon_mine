using Parameters, Interpolations, Plots, LinearAlgebra, QuantEcon, Distributions, Random

#Probem 1


# Problem 2
function mc_sample_path(P; init_x = 1, sample_size = 100)
    @assert size(P)[1] == size(P)[2] # square required
    N = size(P)[1] # number of states
    dists = [Categorical(P[i, :]) for i in 1:N]
    X = Vector{Int64}(undef, sample_size) # allocate memory
    X[1] = init_x # set the initial state

    for t in 2:sample_size
        previous_state_value = X[t-1]
        P_Xt = dists[previous_state_value] # appropriate distribution  
        X[t] = rand(P_Xt) # draw new value
    end
    return X
end
α = 0.1;   # finds job  
β = 0.05;    # loses job

P = [1-α α; 
     β 1-β]
     ψ0 = [0.05 0.95]
     periods = 100
     sample_path_initU = mc_sample_path(P, init_x = 1, sample_size = periods);
     sample_path_initE = mc_sample_path(P, init_x = 2, sample_size = periods);
     
     
     plot(sample_path_initE, label = "start employed")
     plot!(sample_path_initU, label = "start unemployed")

     # Poblem 2 mccall
     function create_job_search_model(;
        n=100, # wage grid size
        w_min=10.0, # lowest wage
        w_max=60.0, # highest wage
        β=0.96, # discount factor
        c=10.0, # unemployment compensation
      p=0.01
        )
        wages = range(w_min, w_max, length=n)

        return (; n, wages, β, c)
    end
    my_model=return create_job_search_model
    π = ones(length(wages)) ./ length(wages)
    V_u=zeros(n)
    V_e=zeros(n)
    V_u_new = [max(V_e[w], c + β * sum(V_u .* π )) for w in 1:n]
    V_e_new = [wages[w] + β * ((1 - p) * V_e[w] + p * sum(V_u .* π)) for w in 1:n]
    V_u .= V_u_new
        V_e .= V_e_new
        w=  minimum(wages[V_e .>= c + β * sum(V_u .* π)]) #reservation wage
        reservation_wages = [create_job_search_model(p=p)[:reservation_wage] for p in p_values]
        p_values = 0:0.05:1.0
        plot(
    p_values, w, xlabel="p", ylabel="Reservation Wage (w)", title="propability of unemployed", label="w*",
    legend=:bottomright
)