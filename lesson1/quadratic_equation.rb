puts "Lets find the discriminant and roots!"

puts "Please enter the A index: "
a_index = gets.chomp.to_f

puts "Please enter the B index: "
b_index = gets.chomp.to_f

puts "Please enter the C index: "
c_index = gets.chomp.to_f

discriminant = (b_index**2) - (4 * a_index * c_index)
x1 = (- b_index + Math.sqrt(discriminant)) / (2 * a_index)
x2 = (- b_index - Math.sqrt(discriminant)) / (2 * a_index)

if discriminant > 0	
	puts "Discriminant is #{discriminant}; the first root is #{x1}; the second root is #{x2}."
elsif discriminant == 0
	puts "Discriminant is #{discriminant}; the root is #{x1}."
else
	puts "Discriminant is #{discriminant}; there are no roots."
end
