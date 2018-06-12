class MainInterface

  def initialize(interface)
    @interface = interface
    @all_trains = []
    @all_stations = []
    @all_routes = []
    @all_carriages = []
  end

  def start
     
    loop do
      case @interface.user_main_menu_choice
      when '1'
        loop do
          case @interface.user_station_choice
          when '1'
            loop do
              attempt = 0
              begin
                station_name = @interface.user_given_station_name.capitalize
                break if station_name == "Stop"
                attempt += 1
                new_station = Station.new(station_name)
                @all_stations << new_station
                @interface.station_created_message
              rescue Exception => e
                @interface.print_exception(e)
                retry if attempt < 3
              ensure
                @interface.attempt_number(attempt)
              end
            end
          when '2'
            if @all_stations.empty?
              @interface.no_stations_message
            else
              Station.display_all_stations(@all_stations)
            end
            @interface.station_instances_number_message
          when '3'
            loop do
              station_name = @interface.user_given_station_name.capitalize
              break if station_name == "Stop"
              chosen_station = Station.get_station_by_name(@all_stations, station_name)
              if chosen_station.nil?
                @interface.station_not_found_messsage
              else
                @interface.all_trains_message
                chosen_station.display_all_trains
              end
            end
          when '4'
            loop do
              station_name = @interface.user_given_station_name.capitalize
              break if station_name == "Stop"
              chosen_station = Station.get_station_by_name(@all_stations, station_name)
              if chosen_station.nil?
                @interface.station_not_found_messsage
              else
                @interface.all_trains_message
                chosen_station.display_all_trains_by_block
              end
            end
          when '5'
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
              @interface.create_route_info_message
              @interface.all_created_stations_message
              Station.display_all_stations(@all_stations)
              if @all_stations.empty?
                @interface.if_all_stations_empty
              else
                loop do
                  attempt = 0
                  begin
                    route_name = @interface.user_given_route_name.capitalize
                    break if route_name == "Stop"
                    attempt += 1
                    first_station_name = @interface.user_given_first_station_name.capitalize
                    break if first_station_name == "Stop"
                    first_station = Station.get_station_by_name(@all_stations, first_station_name)
                    @interface.station_not_found_messsage if first_station.nil?
                    last_station_name = @interface.user_given_last_station_name.capitalize
                    break if last_station_name == "Stop"
                    last_station = Station.get_station_by_name(@all_stations, last_station_name)
                    @interface.station_not_found_messsage if last_station.nil?
                    new_route = Route.new(route_name, first_station, last_station)
                    @all_routes << new_route
                    @interface.route_created_message
                  rescue Exception => e
                    @interface.print_exception(e)
                  retry if attempt < 3
                  ensure
                    @interface.attempt_number(attempt)
                  end
                end
              end
          when '2'
              @interface.all_created_routes_message
              Route.display_all_routes(@all_routes)
              if @all_routes.empty?
                @interface.if_all_routes_empty
              else
                loop do
                  @interface.stations_to_out_route_info_message
                  route_name = @interface.user_given_route_name.capitalize
                  break if route_name == "Stop"
                  chosen_route = Route.get_route_by_name(@all_routes, route_name)
                  if chosen_route.nil?
                    @interface.route_not_found_messsage
                  else
                    @interface.show_current_station_list
                    chosen_route.display_all_station_list
                    station_name = @interface.user_given_station_name.capitalize
                    break if station_name == "Stop"
                    new_station = Station.new(station_name)
                    @all_stations << new_station
                    chosen_route.add_station(new_station)
                    @interface.show_current_station_list
                    chosen_route.display_all_station_list
                  end
                end
              end
          when '3'
            @interface.all_created_routes_message
            Route.display_all_routes(@all_routes)
            if @all_routes.empty?
              @interface.if_all_routes_empty
            else
              loop do
                @interface.stations_to_out_route_info_message
                route_name = @interface.user_given_route_name.capitalize
                break if route_name == "Stop"
                chosen_route = Route.get_route_by_name(@all_routes, route_name)
                if chosen_route.nil?
                  @interface.route_not_found_messsage
                else
                  @interface.show_current_station_list
                  chosen_route.display_all_station_list
                  station_name = @interface.user_given_station_name.capitalize
                  break if station_name == "Stop"
                  chosen_route.delete_station(station_name)
                  @interface.show_current_station_list
                  chosen_route.display_all_station_list
                end
              end
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
              attempt = 0
              begin
                @interface.exit_loop_message
                train_name = @interface.user_given_train_name.capitalize
                break if train_name == "Stop"
                attempt += 1
                train_type = @interface.user_given_train_type
                new_train = Train.for(train_name, train_type)
                new_train.company_name = "RZD Moscow"
                @all_trains << new_train
                @interface.train_created_message
                @interface.train_company_name_message
                new_train.print_company_name
              rescue Exception => e
                @interface.print_exception(e)
                retry if attempt < 3
              ensure
                @interface.attempt_number(attempt)
              end
            end
          when '2'
            @interface.all_created_trains_message
            Train.display_all_trains(@all_trains)
            @interface.all_created_routes_message
            Route.display_all_routes(@all_routes)
            @interface.set_route_to_train_info_message
            if @all_trains.empty? || @all_routes.empty?
              @interface.if_all_routes_empty
              @interface.if_all_trains_empty
            else
              loop do
                train_name = @interface.user_given_train_name.capitalize
                break if train_name == "Stop"
                chosen_train = Train.get_train_by_name(@all_trains, train_name)
                route_name = @interface.user_given_route_name.capitalize
                break if route_name == "Stop"
                chosen_route = Route.get_route_by_name(@all_routes, route_name)
                if chosen_route.nil?
                  @interface.route_not_found_messsage
                else
                  chosen_train.set_route(chosen_route)
                  @interface.route_set_message
                  @interface.current_station
                  chosen_train.current_station.name
                end
              end
            end
          when '3'
            loop do
              train_name = @interface.user_given_train_name.capitalize
              break if train_name == "Stop"
              chosen_train = Train.get_train_by_name(@all_trains, train_name)
              if chosen_train.nil?
                @interface.train_not_found_messsage
              else
                chosen_train.go_to_next_station
                @interface.train_moved_message
                @interface.current_station
                chosen_train.current_station.name
              end
            end
          when '4'
            loop do
              train_name = @interface.user_given_train_name.capitalize
              break if train_name == "Stop"
              chosen_train = Train.get_train_by_name(@all_trains, train_name)
              if chosen_train.nil?
                @interface.train_not_found_messsage
              else
                chosen_train.go_to_prev_station
                @interface.train_moved_message
                @interface.current_station
                chosen_train.current_station.name
              end
            end
          when '5'
            if @all_trains.empty?
              @interface.no_trains_message
            else
              Train.display_all_trains(@all_trains)
            end
            @interface.train_instances_number_message
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
            @interface.all_created_trains_message
            Train.display_all_trains(@all_trains)
            train_name = @interface.user_given_train_name.capitalize
            chosen_train = Train.get_train_by_name(@all_trains, train_name)
            if chosen_train.nil?
                @interface.train_not_found_messsage
            else
              i = 0
              loop do
                i += 1
                break if i > number_of_carriages
                carriage_type = @interface.user_given_carriage_type
                break if carriage_type.downcase ==  "stop"
                new_carriage = case carriage_type
                when "pass"
                  PassengerCarriage.new
                when "cargo"
                  CargoCarriage.new
                else
                  @interface.type_not_exist
                end
                @all_carriages << new_carriage
                new_carriage.company_name = "RZD St.Peterburg"
                chosen_train.add_carriage(new_carriage)
                @interface.total_num_carriages_message
                chosen_train.total_number_carriages
                @interface.carriage_company_name_message
                new_carriage.print_company_name
              end
            end
          when '2'
            loop do
              @interface.all_created_trains_message
              Train.display_all_trains(@all_trains)
              train_name = @interface.user_given_train_name.capitalize
              chosen_train = Train.get_train_by_name(@all_trains, train_name)
              if chosen_train.nil?
                @interface.train_not_found_messsage
              else
                carriage_number = @interface.user_carriage_remove_number.to_i
                break if carriage_number == 0
                chosen_train.remove_carriage(carriage_number)
                @interface.total_num_carriages_message
                chosen_train.total_number_carriages
              end
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
