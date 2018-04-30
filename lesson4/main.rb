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

all_trains = []
all_stations = []
all_routes = []
all_carriages = []

loop do 
  puts "Main menu. What would you like to do?"
  puts "-- Type '1' to choose Stations."
  puts "-- Type '2' to choose Routes."
  puts "-- Type '3' to choose Trains."
  puts "-- Type '4' to choose Carriages."
  puts "-- Type '0' to exit the program."
  choice = gets.chomp
  case choice
  when '1'
    loop do
      case Station.user_station_choice
      when '1'
        loop do
          puts "What is the name of station? To exit the loop, type - stop."
          station_name = gets.chomp.capitalize
          break if station_name == "Stop"
          new_station = Station.new(station_name)
          all_stations << new_station
          puts "Your station is created successfully"
        end
      when '2'
        Station.display_all_stations(all_stations)
      when '3'
        loop do
          puts "What is the name of station? To exit the loop, type - stop."
          station_name = gets.chomp.capitalize
          break if station_name == "Stop"
          chosen_station = Station.get_station_by_name(all_stations, station_name)
          puts "The list of trains on the station: "
          chosen_station.display_all_trains
        end
      when '4'
        break
      when '0'
        exit
      else
        puts "Sorry, I didn't understand you."
      end
    end
  when '2'
    loop do
      case Route.user_route_choice
      when '1'
        loop do
          puts "What is the route name? To exit the loop, type - stop."
          route_name = gets.chomp.capitalize
          break if route_name == "Stop"
          puts "Type the name of first station of this route from the existing list of stations: "
          first_station_name = gets.chomp.capitalize
          first_station = Station.get_station_by_name(all_stations, first_station_name)
          puts "Type the name of last station of this route from the existing list of stations: "
          last_station_name = gets.chomp.capitalize
          last_station = Station.get_station_by_name(all_stations, last_station_name)
          new_route = Route.new(route_name, first_station, last_station)
          all_routes << new_route
          puts "Your route is created successfully"
        end
      when '2'
        puts "What is the name of existing route you want to add a station(s): "
        route_name = gets.chomp.capitalize
        chosen_route = Route.get_route_by_name(all_routes, route_name)
        puts "The current list of stations in your chosen route: "
        chosen_route.display_all_stations
        loop do
          puts "What is the name of station you want to add? To exit the loop, type - stop."
          station_name = gets.chomp.capitalize
          break if station_name == "Stop"
          new_station = Station.new(station_name)
          all_stations << new_station
          chosen_route.add_station(new_station)
          puts "The station list of current route: "
          puts chosen_route.display_all_stations
        end
      when '3'
        puts "What is the name of existing route where would you like to delete a station(s): "
        route_name = gets.chomp.capitalize
        chosen_route = Route.get_route_by_name(all_routes, route_name)
        puts "The current list of stations in your chosen route: "
        chosen_route.display_all_stations
        loop do
          puts "What is the name of station you want to remove? To exit the loop, type - stop."
          station_name = gets.chomp.capitalize
          break if station_name == "Stop"
          chosen_route.delete_station(station_name)
          puts "The station list of current route: "
          puts chosen_route.display_all_stations
        end
      when '4'
        break
      when '0'
        exit
      else
        puts "Sorry, I didn't understand you."
      end
    end
  when '3'
    loop do
      case Train.user_train_choice
      when '1'
        loop do
          puts "What is the name of train? To exit the loop, type - stop."
          train_name = gets.chomp.capitalize
          break if train_name == "Stop"
          puts "What is the type of train? Type pass or cargo"
          train_type = gets.chomp.downcase
          new_train = Train.for(train_name, train_type)
          all_trains << new_train
          puts "Your train #{train_name}, #{train_type} was created successfully."
        end
      when '2'
        loop do
          puts "What is the name of train? To exit the loop, type - stop."
          train_name = gets.chomp.capitalize
          break if train_name == "Stop"
          chosen_train = Train.get_train_by_name(all_trains, train_name)
          puts "What is the name of route that you want to attach to the train: "
          route_name = gets.chomp.capitalize
          chosen_route = Route.get_route_by_name(all_routes, route_name)
          chosen_train.set_route(chosen_route)
          puts "The route is set to the train. Current station:"
          puts chosen_train.current_station.name
        end
      when '3'
        loop do
          puts "What is the name of train you want to move one station ahead? To exit the loop, type - stop."
          train_name = gets.chomp.capitalize
          break if train_name == "Stop"
          chosen_train = Train.get_train_by_name(all_trains, train_name)
          chosen_train.go_to_next_station
          puts "The train moved to the next station and now the current station:"
          puts chosen_train.current_station.name
        end
      when '4'
        loop do
          puts "What is the name of train you want to move one station back? To exit the loop, type - stop."
          train_name = gets.chomp.capitalize
          break if train_name == "Stop"
          chosen_train = Train.get_train_by_name(all_trains, train_name)
          chosen_train.go_to_prev_station
          puts "The train moved one station back and now the current station:"
          puts chosen_train.current_station.name
        end
      when '5'
      when '6'
        break
      when '0'
        exit
      else
        puts "Sorry, I didn't understand you."
      end 
    end
  when '4'
    loop do 
      case user_carriage_choice
      when '1'
      when '2'
      when '3'
      when '4'
        break
      when '0'
        exit
      else
        puts "Sorry, I didn't understand you."
      end
    end
  when '0'
      exit
  else
      puts "Sorry, I didn't understand you."
  end
end
