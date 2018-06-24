class Interface
  def user_main_menu_choice
    show_main_menu
    gets.chomp
  end

  def show_main_menu
    puts "Main menu. What would you like to do?"
    puts "-- Type '1' to choose Stations."
    puts "-- Type '2' to choose Routes."
    puts "-- Type '3' to choose Trains."
    puts "-- Type '4' to choose Carriages."
    puts "-- Type '0' to exit the program."
  end

  def not_valid_input_message
    puts "Sorry, I didn't understand you."
  end

  def exit_loop_message
    puts "To exit the loop, type - stop."
  end

  def print_exception(e)
    puts e.inspect
    puts "Please try again. Wrong input."
  end

  def attempt_number(attempt)
    puts "There was #{attempt} attempts."
  end
#-----------Train-------------
  def user_train_choice
    show_train_menu
    gets.chomp
  end

  def show_train_menu
    puts "Choose from the following:"
    puts "-- Type '1' to create a train(s)."
    puts "-- Type '2' to set a route for a train."
    puts "-- Type '3' to move a train one station ahead."
    puts "-- Type '4' to move a train one station back."
    puts "-- Type '5' to show all created trains/show number of instances."
    puts "-- Type '6' to book a seat/volume, show the number of free and booked seats/volume at the chosen carriage."
    puts "-- Type '7' to display all carriages for chosen train by using BLOCK."
    puts "-- Type '8' to go to the main menu."
    puts "-- Type '0' to exit the program."
  end

  def user_given_train_name
    request_train_name
    gets.chomp
  end

  def request_train_name
    puts "What is the number(name) of train?"
  end

  def user_given_train_type
    request_train_type
    gets.chomp
  end

  def request_train_type
    puts "What is the type of train? Type pass or cargo"
  end

  def train_created_message
    puts "Your train is created successfully"
  end

  def set_route_to_train_info_message
    puts "Use existing routes and trains."
  end

  def route_set_message
    puts "The route is set to the train."
  end

  def current_station
    puts "Current station:"
  end

  def train_moved_message
    puts "The train moved one station."
  end

  def all_created_trains_message
    puts "The list of existing trains: "
  end

  def if_all_trains_empty
    puts "Please create a train."
  end

  def train_not_found_messsage
    puts "Train not found."
  end

  def no_trains_message
    puts "There are no trains."
  end

  def train_instances_number_message
    puts "The number of created train instances: #{Train.instances}"
  end

  def carriage_added
    puts "Carriage is added."
  end

  def stop_train_message
    puts "Your speed > 0. You need to stop the train."
  end

  def carriage_removed
    puts "This carriage is removed."
  end

  def can_not_remove_carriage
    puts "Can not remove the carriage because: "
    puts "1) Your speed > 0; 2) Train does not have this carriage."
  end

  def no_route_set
    puts "No route set"
  end

  def no_such_route
    puts "There is no such route."
  end

  def on_last_station
    puts "You are on the last station."
  end

  def on_first_station
    puts "You are on the first station."
  end

  def no_previous_station
    puts "There is no previous station."
  end

  def no_next_station
    puts "There is no next station."
  end

  def non_passenger_carriage
    puts "Can't add non passenger carriage to passenger train."
  end

  def non_cargo_carriage
    puts "Can't add non cargo carriage to cargo train."
  end

  def user_given_carriage_num
    request_carriage_number
    gets.chomp.to_i
  end

  def request_carriage_number
    puts "Give the carriage number to display free places: "
  end

#-----------Station-------------
  def user_station_choice
    show_station_menu
    gets.chomp
  end

  def show_station_menu
    puts "Choose from the following:"
    puts "-- Type '1' to create a station(s)."
    puts "-- Type '2' to display the list of all stations/show number of instances."
    puts "-- Type '3' to display the list of all trains on the station."
    puts "-- Type '4' to display the list of all trains on the station by using BLOCK."
    puts "-- Type '5' to go to the main menu."
    puts "-- Type '0' to exit the program."
  end

  def user_given_station_name
    exit_loop_message
    request_station_name
    gets.chomp
  end

  def request_station_name
    puts "What is the name of station? Give at least 2 characters."
  end

  def station_created_message
    puts "Your station is created successfully"
  end

  def user_given_first_station_name
    exit_loop_message
    request_first_station_name
    gets.chomp
  end

  def request_first_station_name
    puts "What is the name of the first station?"
  end

  def user_given_last_station_name
    exit_loop_message
    request_last_station_name
    gets.chomp
  end

  def request_last_station_name
    puts "What is the name of the last station?"
  end

  def all_trains_message
    puts "The list of all trains on the station: "
  end

  def all_created_stations_message
    puts "The list of existing stations: "
  end

  def if_all_stations_empty
    puts "Please create stations."
  end

  def train_company_name_message
    puts "The name of train manufacture company: "
  end

  def station_not_found_messsage
    puts "Station not found."
  end

  def no_stations_message
    puts "There are no stations."
  end

  def station_instances_number_message
    puts "The number of created station instances: #{Station.instances}"
  end

  def train_on_station
    puts "Train is already on the station."
  end

  def train_not_on_station
    puts "Train is not on the station."
  end

  def no_trains_on_station
    puts "There are no trains on the station."
  end
#-----------Route-------------
  def user_route_choice
    show_route_menu
    gets.chomp
  end

  def show_route_menu
    puts "Choose from the following:"
    puts "-- Type '1' to create a route(s)."
    puts "-- Type '2' to add a station(s) to route (between the first and last stations)."
    puts "-- Type '3' to remove a station from route."
    puts "-- Type '4' to go to the main menu."
    puts "-- Type '0' to exit the program."
  end

  def user_given_route_name
    exit_loop_message
    request_route_name
    gets.chomp
  end

  def request_route_name
    puts "What is the route name? Give at least 2 characters."
  end

  def create_route_info_message
    puts "Give the route name, then the name of the first station and then the name of the last station. Use the existing stations. The order is important!"
  end

  def route_created_message
    puts "Your route is created successfully"
  end

  def stations_to_out_route_info_message
    puts "Choose the existing route name!"
  end

  def show_current_station_list
    puts "The current list of stations in your chosen route: "
  end

  def all_created_routes_message
    puts "The list of all existing routes: "
  end

  def if_all_routes_empty
    puts "Please create a route."
  end

  def route_not_found_messsage
    puts "Route not found."
  end

  def station_included_in_route
    puts "Station has been already included in the route."
  end

  def station_was_added
    puts "#{station.name} was added."
  end

  def station_was_deleted
    puts "#{station.name} was deleted."
  end

  def station_not_found
    puts "Station is not found or it is a first/last one!"
  end

#-----------Carriage-------------
  def user_carriage_choice
    show_carriage_menu
    gets.chomp
  end

  def show_carriage_menu
    puts "Choose from the following:"
    puts "-- Type '1' to create a carriage(s) and add them to the train."
    puts "-- Type '2' to remove a carriage from train."
    puts "-- Type '3' to go to the main menu."
    puts "-- Type '0' to exit the program."
  end

  def user_carriage_number_choice
    add_carriage_number_message
    gets.chomp
  end

  def add_carriage_number_message
    puts "How many carriages do you want to add to your train?"
  end

  def user_given_seat_num
    request_seat_num
    gets.chomp.to_i
  end

  def request_seat_num
    puts "Provide the number of passenger seats: "
  end

  def user_given_volume_num
    request_volume_num
    gets.chomp.to_i
  end

  def request_volume_num
    puts "Provide the volume number: "
  end

  def user_carriage_remove_number
    remove_carriage_message
    gets.chomp
  end

  def remove_carriage_message
    puts "What carriage number do you want to remove?"
  end

  def user_given_carriage_type
    exit_loop_message
    request_carriage_type
    gets.chomp
  end

  def request_carriage_type
    puts "Provide the type of carriage for every carriage. Type pass or cargo: "
  end

  def user_given_carriage_number
    request_carriage_num
    gets.chomp
  end

  def request_carriage_num
    puts "Provide the carriage number:"
  end

  def total_num_carriages_message
    puts "Total number of carriages that are attached to this train: "
  end

  def carriage_company_name_message
    puts "The name of carriage manufacture company: "
  end

  def type_not_exist
    puts "Carriage type doesn't exist."
  end

  def total_seat_number
    puts "Total number of seats:"
  end

  def total_volume_number
    puts "Total volume:"
  end

  def show_quantity
    puts "Free quantity for every carriage (starting from the first one):"
  end

  def book_seat_question
    request_book_seat
    gets.chomp  
  end

  def request_book_seat
    puts "To book a seat one by one, type: yes. To stop booking, type: stop."
  end

  def book_volume_question
    request_book_volume
    gets.chomp  
  end

  def request_book_volume
    puts "Provide volume(number) to book or type 0(zero) to exit: "
  end

  def free_seats
    puts "Free seats:"
  end

  def free_volume
    puts "Free volume:"
  end

  def free_volume
    puts "Free volume:"
  end

  def booked_seats
    puts "Booked seats:"
  end

  def booked_volume
    puts "Booked volume:"
  end

  def seat_is_booked
    puts "Your seat is booked."
  end

  def volume_is_booked
    puts "Your volume is booked."
  end

  def no_seats_left
    puts "There are no free seats left."
  end

  def left_volume_num
    puts "Number of volume left: "
  end
end
