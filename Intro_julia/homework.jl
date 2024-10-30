Plots

3.
n=5
function my_factorial(n)
    output = factorial(n) 
        println("Output:" , output)
    end 
my_factorial



#Problem 6
function standard_deviation(x)
    n=length(x)
    β1=sqrt((1/n-1)*sum((x.-(sum(x)/length(x))^2)))
  return β1
end
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