puts "Fibonacii numbers up to 100: "

first_num = 0
second_num = 1
next_num = 0

while next_num <= 100
  print next_num.to_s + " "
  first_num = second_num
  second_num = next_num
  next_num = first_num + second_num
end
