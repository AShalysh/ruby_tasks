print "What is your name? "
user_name = gets.chomp.capitalize

print "Dear #{user_name}, what is your height? "
user_height = gets.chomp.to_f

perfect_weight = user_height - 110

if perfect_weight >= 0
  puts "#{user_name}, your perfect weight is #{perfect_weight}kg."
else
  puts "Your weight is already acceptable."
end
