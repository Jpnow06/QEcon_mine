using PrettyTables, Plots, LaTeXStrings, LinearAlgebra, NLsolve, Roots, Iterativesolvers, Calculus

# Homework 2

2.
function exact_solution(α,β)
    x5=1
    x4=x5
    x3=x4
    x2=x3
    x1=x2-α-x4*(α-β)-x5*(β)
    return [x1,x2,x3,x4,x5]

    
    
end
exact_solution(4,7)
function backlslash_x(α,β) 
A=[1 -1 0 α-β β ; 0 1 -1 0 0 ; 0 0 1 -1 0 ; 0 0 0 1 -1 ; 0 0 0 0 1]
b=[α ; 0 ; 0 ; 0 ; 1]
x = A\ b
return x
end
backlslash_x(2,8) 

function relative_residual(α,β)
    A=[1 -1 0 α-β β ; 0 1 -1 0 0 ; 0 0 1 -1 0 ; 0 0 0 1 -1 ; 0 0 0 0 1]
b=[α ; 0 ; 0 ; 0 ; 1]
return norm(A*backlslash_x(α,β)-b)/norm(b)
end
relative_residual(4,5)

function condition_numerator(α,β)
    A=[1 -1 0 α-β β ; 0 1 -1 0 0 ; 0 0 1 -1 0 ; 0 0 0 1 -1 ; 0 0 0 0 1]
b=[α ; 0 ; 0 ; 0 ; 1]
 norm_A=norm(A,2)
 inv_norm_A=norm(inv(A))
 return norm_A*inv_norm_A
end

condition_numerator(3,16)



function task_1(f, x0; tol=1e-6, maxiter=1000, α=0.0)
g(x) = f(x) + x

x_values = Float64[x0]
residuals = Float64[] 

for iteration in 1:maxiter

    x1 = (1 - α) * g(x0) + α*x0
    push!(x_values, x1)

    residual = abs(x1 - x0)
    push!(residuals, residual)

    if residual < tol
        return (0, x1, f(x1), abs(x1 - g(x1)), x_values, residuals)
    end

    x0 = x1
end

return (1, NaN, NaN, NaN, x_values, residuals)
end

function somefunction()
f(x) = (x + 1)^(1/3) - x

result = task_1(f, 1.0; tol=1e-6, maxiter=1000, α=0.0)
println("Result: ", result)
end

somefunction()



