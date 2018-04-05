puts "The numbers from 10 to 100 with step of 5 in the array: "

array_num = []

for num in 10..100 
  if num % 5 == 0
	  array_num << num
  end
end 

print array_num
