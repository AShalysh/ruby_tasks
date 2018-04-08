array_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

print "Please enter the day number: "
day_num = gets.chomp.to_i

print "Please enter the month number: "
month_num = gets.chomp.to_i

print "Please enter the year number: "
year_num = gets.chomp.to_i 

array_month[1] = 29 if year_num % 4 == 0 && year_num % 100 != 0 || year_num % 400 == 0

puts  array_month.first(month_num - 1).reduce(:+) + day_num