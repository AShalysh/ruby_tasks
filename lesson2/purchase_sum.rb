purchase_hash = {}
total_purchase_price = 0

loop do
  puts "Please enter the name of the product: "
  product_name = gets.chomp.to_s
  break if product_name == "stop"
  puts "Please enter the price of the product: "
  product_price = gets.chomp.to_f
  puts "Please enter the quantity of the product(s): "
  product_num = gets.chomp.to_f
  purchase_hash[product_name.to_sym] = { price: product_price, number: product_num }
end

puts purchase_hash

purchase_hash.each do |key, value|
  total_price = value[:price] * value[:number]
  puts "#{key} is #{total_price}"
  total_purchase_price += total_price
end

puts "The total purchase price is #{total_purchase_price}"
