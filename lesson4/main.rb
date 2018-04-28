require 'pry-nav'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'

puts "Welcome to our RZD system!"

loop do
  puts "1. Lets create a train."
  puts " Type 'stop' for name to stop entering data (to exit the loop)."
  puts "What is the name (or number) of train?"
  train_name = gets.chomp.capitalize
  break if train_name == "Stop"
  puts "What is the type of train? Type pass or cargo"
  train_type = gets.chomp.downcase
  new_train = Train.for(train_name, train_type)
  puts "Your train #{train_name}, #{train_type} was created successfully."

  puts "2. Lets create a route for this train with the first and last stations: "
  puts "What is the name of the first station of this route?"
  first_station_name = gets.chomp.capitalize
  first_station = Station.new(first_station_name)
  puts "What is the name of the last station of this route?"
  last_station_name = gets.chomp.capitalize
  last_station = Station.new(last_station_name)
  new_route = Route.new(first_station, last_station)
  puts "Your route with the first station: #{first_station_name} and last station: #{last_station_name} was created successfully."

  puts "3. Would you like to add other station(s) between the first and last stations for the route? Type - yes or no."
  choice = gets.chomp.downcase
  if choice == "yes"
    loop do
      puts "What is the name of station? To exit the loop, type - stop."
      station_name = gets.chomp.capitalize
      break if station_name == "Stop"
      new_station = Station.new(station_name)
      new_route.add_station(new_station)
    end
  end

  puts "Current station list:"
  new_route.display_all_stations

  puts "4. Would you like to remove a station(s) between the first and last stations for the route? Type - yes or no."
  choice = gets.chomp.downcase
  if choice == "yes"
    loop do
      puts "What is the name of station you want to remove? To exit the loop, type - stop."
      station_name = gets.chomp.capitalize
      break if station_name == "Stop"
      new_route.delete_station(station_name)
    end
  end

  puts "Updated station list in case you removed station(s):"
  new_route.display_all_stations

  puts "5. How many carriages do you want to add to your train?"
  number_of_carriages = gets.chomp.to_i
  i = 0
  loop do 
    i += 1
    break if i > number_of_carriages
    puts "What type of carriages do you want to add, type pass or cargo: "
    carriage_type = gets.chomp
    new_carriage = Carriage.for(carriage_type)
    new_train.add_carriage(new_carriage)
  end

  puts "Total number of carriages is " 
  puts new_train.total_number_carriages

  puts "6. Do you want to remove a carriage(s)? Type - yes or no."
  choice = gets.chomp.downcase
  if choice == "yes"
    loop do
      puts "What is the number of carriage you want to delete? Type 0 to exit the loop."
      carriage_number = gets.chomp.to_i
      break if carriage_number == 0
      new_train.remove_carriage(carriage_number)
      puts "Now total number of carriages is "
      puts new_train.total_number_carriages
    end
  end
  
  puts "7. The route is set to the train."
  new_train.set_route(new_route)
  # binding.pry
  puts "Current station:"
  puts new_train.current_station.name

  new_train.go_to_next_station
  puts "8. Train moved to the next station and now the current station:"
  puts new_train.current_station.name

  new_train.go_to_prev_station
  puts "9. Train moved to the previous station and now the current station:"
  puts new_train.current_station.name
  
  puts "10. Type the name of station to display all trains that are on the station:"
  station_name = gets.chomp.capitalize
  new_route.get_station_by_name(station_name).display_all_trains
end
