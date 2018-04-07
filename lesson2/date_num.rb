array_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
total_days_of_months = 0

print "Please enter the day number: "
day_num = gets.chomp.to_i

print "Please enter the month number: "
month_num = gets.chomp.to_i

print "Please enter the year number: "
year_num = gets.chomp.to_i 

array_month[1] = 29 if year_num % 4 == 0 && year_num % 100 != 0 || year_num % 400 == 0

array_month.each_with_index do |value, index|
  break if index >= month_num - 1  
  total_days_of_months += value 
end

puts total_days_of_months + day_num
