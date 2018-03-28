puts "Lets check if it is a rectangular triangle: "

puts "Please enter the length of the A side: "
a_side = gets.chomp.to_f

puts "Please enter the length of the B side: "
b_side = gets.chomp.to_f

puts "Please enter the length of the C side: "
c_side = gets.chomp.to_f

if a_side == b_side && a_side == c_side
  puts "it is an equilateral and isosceles triangle."
end

if a_side > b_side && a_side > c_side
  hypotenuse = a_side
  cathetus_one = b_side
  cathetus_two = c_side
elsif b_side > a_side && b_side > c_side
  hypotenuse = b_side
  cathetus_one = a_side
  cathetus_two = c_side 
elsif c_side > a_side && c_side > b_side
  hypotenuse = c_side
  cathetus_one = b_side
  cathetus_two = a_side 
else 
  puts "It is not a rectangular triangle."
end

if hypotenuse && hypotenuse**2 == cathetus_one**2 + cathetus_two**2
  puts "It is a rectangular triangle."
  if a_side == b_side || a_side == c_side || b_side == c_side
    puts "it is an isosceles triangle."
  end
end
