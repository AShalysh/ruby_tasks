puts "Fibonacii numbers up to 100: "

first_num = 0
second_num = 1
next_num = 0
array_fibonacii = []

while next_num <= 100
  array_fibonacii << next_num
  first_num = second_num
  second_num = next_num
  next_num = first_num + second_num
end

print array_fibonacii 
