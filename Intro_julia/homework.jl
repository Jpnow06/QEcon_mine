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