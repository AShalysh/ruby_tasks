puts "Lets check the type of our triangle: "

puts "Please enter the length of the A side: "
a_side = gets.chomp.to_f

puts "Please enter the length of the B side: "
b_side = gets.chomp.to_f

puts "Please enter the length of the C side: "
c_side = gets.chomp.to_f

if a_side > b_side && a_side > c_side
  hypotenuse = a_side
  cathetus_one = b_side
  cathetus_two = c_side
elsif b_side > a_side && b_side > c_side
  hypotenuse = b_side
  cathetus_one = a_side
  cathetus_two = c_side
else
  hypotenuse = c_side
  cathetus_one = b_side
  cathetus_two = a_side
end

is_rect = hypotenuse**2 == cathetus_one**2 + cathetus_two**2

if is_rect && cathetus_one == cathetus_two
  puts "It is a rectangular and isosceles triangle."
elsif is_rect
  puts "It is a rectangular triangle."
elsif hypotenuse == cathetus_one && hypotenuse == cathetus_two
  puts "it is an equilateral triangle."
else
  puts "It is not a rectangular triangle."
end
