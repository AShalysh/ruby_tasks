class MainInterface
  def initialize(interface)
    @interface = interface
  end 

  def start
    all_trains = []
    all_stations = []
    all_routes = []
    all_carriages = []
    
    loop do 
      case @interface.user_main_menu_choice
      when '1'
        loop do
          case @interface.user_station_choice
          when '1'
            loop do
              station_name = @interface.user_given_station_name.capitalize
              break if station_name == "Stop"
              new_station = Station.new(station_name)
              all_stations << new_station
              @interface.station_created_message
            end
          when '2'
            Station.display_all_stations(all_stations)
          when '3'
            loop do
              station_name = @interface.user_given_station_name.capitalize
              break if station_name == "Stop"
              chosen_station = Station.get_station_by_name(all_stations, station_name)
              @interface.all_trains_message
              chosen_station.display_all_trains
            end
          when '4'
            break
          when '0'
            exit
          else
            @interface.not_valid_input_message
          end
        end
      when '2'
        loop do
          case @interface.user_route_choice
          when '1'
            loop do
              @interface.create_route_info_message
              route_name = @interface.user_given_route_name.capitalize
              break if route_name == "Stop"
              first_station_name = @interface.user_given_station_name.capitalize
              break if first_station_name == "Stop"
              first_station = Station.get_station_by_name(all_stations, first_station_name)
              last_station_name = @interface.user_given_station_name.capitalize
              break if last_station_name == "Stop"
              last_station = Station.get_station_by_name(all_stations, last_station_name)
              new_route = Route.new(route_name, first_station, last_station)
              all_routes << new_route
              @interface.route_created_message
            end
          when '2'
            @interface.stations_to_out_route_info_message
            route_name = @interface.user_given_route_name.capitalize
            chosen_route = Route.get_route_by_name(all_routes, route_name)
            @interface.show_current_station_list
            chosen_route.display_all_stations
            loop do
              station_name = @interface.user_given_station_name.capitalize
              break if station_name == "Stop"
              new_station = Station.new(station_name)
              all_stations << new_station
              chosen_route.add_station(new_station)
              @interface.show_current_station_list
              chosen_route.display_all_stations
            end
          when '3'
            @interface.stations_to_out_route_info_message
            route_name = @interface.user_given_route_name.capitalize
            chosen_route = Route.get_route_by_name(all_routes, route_name)
            @interface.show_current_station_list
            chosen_route.display_all_stations
            loop do
              station_name = @interface.user_given_station_name.capitalize
              break if station_name == "Stop"
              chosen_route.delete_station(station_name)
              @interface.show_current_station_list
              chosen_route.display_all_stations
            end
          when '4'
            break
          when '0'
            exit
          else
            @interface.not_valid_input_message
          end
        end
      when '3'
        loop do
          case @interface.user_train_choice
          when '1'
            loop do
              train_name = @interface.user_given_train_name.capitalize
              break if train_name == "Stop"
              train_type = @interface.user_given_train_type
              new_train = Train.for(train_name, train_type)
              all_trains << new_train
              @interface.train_created_message
            end
          when '2'
            loop do
              @interface.set_route_to_train_info_message
              train_name = @interface.user_given_train_name.capitalize
              break if train_name == "Stop"
              chosen_train = Train.get_train_by_name(all_trains, train_name)
              route_name = @interface.user_given_route_name.capitalize
              break if route_name == "Stop"
              chosen_route = Route.get_route_by_name(all_routes, route_name)
              chosen_train.set_route(chosen_route)
              @interface.route_set_message
              @interface.current_station
              chosen_train.current_station.name
            end
          when '3'
            loop do
              train_name = @interface.user_given_train_name.capitalize
              break if train_name == "Stop"
              chosen_train = Train.get_train_by_name(all_trains, train_name)
              chosen_train.go_to_next_station
              @interface.train_moved_message
              @interface.current_station
              chosen_train.current_station.name
            end
          when '4'
            loop do
              train_name = @interface.user_given_train_name.capitalize
              break if train_name == "Stop"
              chosen_train = Train.get_train_by_name(all_trains, train_name)
              chosen_train.go_to_prev_station
              @interface.train_moved_message
              @interface.current_station
              chosen_train.current_station.name
            end
          when '5'
            Train.display_all_trains(all_trains)
          when '6'
            break
          when '0'
            exit
          else
            @interface.not_valid_input_message
          end 
        end
      when '4'
        loop do 
          case @interface.user_carriage_choice
          when '1'
            number_of_carriages = @interface.user_carriage_number_choice.to_i
            train_name = @interface.user_given_train_name.capitalize
            chosen_train = Train.get_train_by_name(all_trains, train_name)
            i = 0
            loop do
              i += 1
              break if i > number_of_carriages
              carriage_type = @interface.user_given_carriage_type
              break if carriage_type == "Stop" || carriage_type == "stop"
              new_carriage = Carriage.for(carriage_type)
              all_carriages << new_carriage
              chosen_train.add_carriage(new_carriage)
              @interface.total_num_carriages_message
              chosen_train.total_number_carriages
            end
          when '2'
            loop do
              train_name = @interface.user_given_train_name.capitalize
              chosen_train = Train.get_train_by_name(all_trains, train_name)
              carriage_number = @interface.user_carriage_remove_number.to_i
              break if carriage_number == 0
              chosen_train.remove_carriage(carriage_number)
              @interface.total_num_carriages_message
              chosen_train.total_number_carriages
            end
          when '3'
            break
          when '0'
            exit
          else
            @interface.not_valid_input_message
          end
        end
      when '0'
          exit
      else
          @interface.not_valid_input_message
      end
    end
  end
end