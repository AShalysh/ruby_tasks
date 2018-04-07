puts "Fibonacii numbers up to 100: "

next_num = 1
array_fibonacii = [0, 1]

while next_num <= 100
  array_fibonacii << next_num
  next_num = array_fibonacii[-1] + array_fibonacii[-2]
end

print array_fibonacii 
