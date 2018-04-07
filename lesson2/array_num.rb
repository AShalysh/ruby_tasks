puts "The numbers from 10 to 100 with step of 5 in the array: "

array_num = []

for num in 10..100 
  array_num << num if num % 5 == 0
end 

print array_num
