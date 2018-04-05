print "Please enter the day number: "
day_num = gets.chomp.to_i

print "Please enter the month number: "
month_num = gets.chomp.to_i

print "Please enter the year number: "
year_num = gets.chomp.to_i

months_days_hash = {
  January: 31,
  February: 28,
  March: 31,
  April: 30,
  May: 31,
  June: 30,
  July: 31,
  August: 31,
  September: 30,
  October: 31,
  November: 30,
  December: 31
}

array_month = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
counter = 0
total_days_of_months = 0
is_leap = false

# checking if it is a leap year
is_leap = true if year_num % 4 == 0 && year_num % 100 != 0 || year_num % 400 == 0

# calculation of total amount of days in previous months
while (counter <= month_num - 2) do
  total_days_of_months += months_days_hash[array_month[counter]]
  counter += 1
end

# final calculation
if is_leap == true && total_days_of_months + day_num > 59 # 59 means the date is passed 28th of February
  result = total_days_of_months + day_num + 1
else
  result = total_days_of_months + day_num
end 

puts result
