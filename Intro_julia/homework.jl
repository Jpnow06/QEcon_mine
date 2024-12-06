using PrettyTables, Plots, LaTeXStrings, LinearAlgebra

3.

function my_factorial(n)
    output = factorial(n) 
        println("Output:" , output)
    end 
my_factorial(9)



#Problem 6 function standard_deviation(x)
    n=length(x)
    β1=sqrt((1/n-1)*sum((x.-(sum(x)/length(x))^2)))
  return β1
x=[1, 2, 5]
 standard_deviation(x)
 n
sum(x)
#Problem 7
data_homework = readdlm("data_analysis//datasets//dataset.csv", ',',Float64)
data_homework
earnings=(data_homework[:,1])
education=(data_homework[:,2])
hours_worked=(data_homework[:,3])
plot_1 = scatter(education,earnings ; legend=false, color=:blue, markersize = 5, opacity=0.7)
plot_2 = scatter(hours_worked,earnings ; legend=false, color=:blue, markersize = 5, opacity=0.7)
xaxis!(plot_1, "education")
yaxis!(plot_1, "earnings")
xaxis!(plot_2, "hours_worked")
yaxis!(plot_2, "earnings")
cor(earnings,education)
cor(earnings,hours_worked)
# Homework 2

2.
function value_x(α,β)
    
A=[1 -1 0 α-β β ; 0 1 -1 0 0 ; 0 0 1 -1 0 ; 0 0 0 1 -1 ; 0 0 0 0 1]
b=[α ; 0 ; 0 ; 0 ; 1]
x = A\ b
return x
end
value_x(-12,7425252)
x1=x[1]
for i in 0:12
    α=0.1
    β_values=[(10.0)^i ]
end
3.

4.
