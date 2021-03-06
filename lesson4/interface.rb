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
    puts "-- Type '5' to show all created trains."
    puts "-- Type '6' to go to the main menu."
    puts "-- Type '0' to exit the program."
  end

  def user_given_train_name
    request_train_name
    gets.chomp
  end

  def request_train_name
    puts "What is the name of train?"
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

#-----------Station-------------
  def user_station_choice
    show_station_menu
    gets.chomp
  end

  def show_station_menu
    puts "Choose from the following:"
    puts "-- Type '1' to create a station(s)."
    puts "-- Type '2' to display the list of all stations."
    puts "-- Type '3' to display the list of all trains on the station."
    puts "-- Type '4' to go to the main menu."
    puts "-- Type '0' to exit the program."
  end

  def user_given_station_name
    exit_loop_message
    request_station_name
    gets.chomp
  end

  def request_station_name
    puts "What is the name of station?"
  end

  def station_created_message
    puts "Your station is created successfully"
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
    puts "What is the route name?"
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

  def total_num_carriages_message
    puts "Total number of carriages that are attached to this train: "
  end

  def carriage_company_name_message
    puts "The name of carriage manufacture company: "
  end
end
