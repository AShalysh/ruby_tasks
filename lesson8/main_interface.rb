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
        station_choice
      when '2'
        route_choice
      when '3'
        train_choice
      when '4'
        carriage_choice
      when '0'
        exit
      else
        @interface.not_valid_input_message
      end
    end
  end

  #---------------Start Method----------
  #--when "1"
  def station_choice
    loop do
      case @interface.user_station_choice
      when '1'
        create_stations
      when '2'
        show_all_stations_num_instances
      when '3'
        show_trains_on_station
      when '4'
        show_trains_on_station_block
      when '5'
        break
      when '0'
        exit
      else
        @interface.not_valid_input_message
      end
    end
  end

  #--when "2"
  def route_choice
    loop do
      case @interface.user_route_choice
      when '1'
        create_routes
      when '2'
        add_stations_to_route
      when '3'
        delete_stations_from_route
      when '4'
        break
      when '0'
        exit
      else
        @interface.not_valid_input_message
      end
    end
  end

  #--when "3"
  def train_choice
    loop do
      case @interface.user_train_choice
      when '1'
        create_trains
      when '2'
        set_route
      when '3'
        move_train_ahead
      when '4'
        move_train_back
      when '5'
        show_all_trains_num_instances
      when '6'
        book_seat_volume
      when '7'
        show_train_carriages_block
      when '8'
        break
      when '0'
        exit
      else
        @interface.not_valid_input_message
      end
    end
  end

  #--when "4"
  def carriage_choice
    loop do
      case @interface.user_carriage_choice
      when '1'
        create_carriages
      when '2'
        remove_carriage
      when '3'
        break
      when '0'
        exit
      else
        @interface.not_valid_input_message
      end
    end
  end

  #---------------Station----------
  #--when "1"
  def create_stations
    loop do
      attempt = 0
      begin
        station_name = @interface.user_given_station_name.capitalize
        break if station_name == 'Stop'
        attempt += 1
        create_station(station_name)
      rescue StandardError => e
        @interface.print_exception(e)
        retry if attempt < 3
      ensure
        @interface.attempt_number(attempt)
      end
    end
  end

  def create_station(station_name)
    new_station = Station.new(station_name, @interface)
    @all_stations << new_station
    @interface.station_created_message
  end

  #--when "2"
  def show_all_stations_num_instances
    if @all_stations.empty?
      @interface.no_stations_message
    else
      Station.display_all_stations(@all_stations)
    end
    @interface.station_instances_number_message
  end

  #--when "3"
  def show_trains_on_station
    loop do
      station_name = @interface.user_given_station_name.capitalize
      break if station_name == 'Stop'
      chosen_station = Station.get_station_by_name(@all_stations, station_name)
      if chosen_station.nil?
        @interface.station_not_found_messsage
      else
        @interface.all_trains_message
        chosen_station.display_all_trains
      end
    end
  end

  #--when "4"
  def show_trains_on_station_block
    loop do
      station_name = @interface.user_given_station_name.capitalize
      break if station_name == 'Stop'
      chosen_station = Station.get_station_by_name(@all_stations, station_name)
      if chosen_station.nil?
        @interface.station_not_found_messsage
      else
        all_trains_on_station(chosen_station)
      end
    end
  end

  def all_trains_on_station(chosen_station)
    @interface.all_trains_message
    chosen_station.display_all_trains_by_block do |train|
      @interface.train_name(train)
      @interface.train_carriages(train)
      train.carriages.each do |carriage|
        @interface.carriage_number(carriage)
        @interface.carriage_type(carriage)
        if_cargo_or_pass_carriage_info(carriage)
      end
    end
  end

  def if_cargo_or_pass_carriage_info(carriage)
    if carriage.is_a?(CargoCarriage)
      @interface.free_volume(carriage)
      @interface.booked_volume(carriage)
    else
      @interface.free_seats(carriage)
      @interface.booked_seats(carriage)
    end
  end

  #---------------Routes----------
  #--when "1"
  def create_routes
    @interface.create_route_info_message
    @interface.all_created_stations_message
    Station.display_all_stations(@all_stations)
    if @all_stations.empty?
      @interface.if_all_stations_empty
    else
      create_routes_loop
    end
  end

  def create_routes_loop
    loop do
      attempt = 0
      begin
        route_name = @interface.user_given_route_name.capitalize
        break if route_name == 'Stop'
        attempt += 1
        first_station_name = @interface.user_given_first_station_name.capitalize
        break if first_station_name == 'Stop'
        first_station = Station.get_station_by_name(@all_stations, first_station_name)
        @interface.station_not_found_messsage if first_station.nil?
        last_station_name = @interface.user_given_last_station_name.capitalize
        break if last_station_name == 'Stop'
        last_station = Station.get_station_by_name(@all_stations, last_station_name)
        @interface.station_not_found_messsage if last_station.nil?
        create_route(route_name, first_station, last_station)
      rescue StandardError => e
        @interface.print_exception(e)
        retry if attempt < 3
      ensure
        @interface.attempt_number(attempt)
      end
    end
  end

  def create_route(route_name, first_station, last_station)
    new_route = Route.new(route_name, first_station, last_station, @interface)
    @all_routes << new_route
    @interface.route_created_message
  end

  #--when "2"
  def add_stations_to_route
    show_all_existing_routes
    if @all_routes.empty?
      @interface.if_all_routes_empty
    else
      loop do
        @interface.stations_to_out_route_info_message
        route_name = @interface.user_given_route_name.capitalize
        break if route_name == 'Stop'
        chosen_route = Route.get_route_by_name(@all_routes, route_name)
        if chosen_route.nil?
          @interface.route_not_found_messsage
        else
          show_stations_for_route(chosen_route)
          station_name = @interface.user_given_station_name.capitalize
          break if station_name == 'Stop'
          create_station(station_name)
          chosen_route.add_station(new_station)
          show_stations_for_route(chosen_route)
        end
      end
    end
  end

  def show_stations_for_route(chosen_route)
    @interface.show_current_station_list
    chosen_route.display_all_station_list
  end

  def show_all_existing_routes
    @interface.all_created_routes_message
    Route.display_all_routes(@all_routes)
  end

  #--when "3"
  def delete_stations_from_route
    show_all_existing_routes
    if @all_routes.empty?
      @interface.if_all_routes_empty
    else
      loop do
        @interface.stations_to_out_route_info_message
        route_name = @interface.user_given_route_name.capitalize
        break if route_name == 'Stop'
        chosen_route = Route.get_route_by_name(@all_routes, route_name)
        if chosen_route.nil?
          @interface.route_not_found_messsage
        else
          show_stations_for_route(chosen_route)
          station_name = @interface.user_given_station_name.capitalize
          break if station_name == 'Stop'
          chosen_route.delete_station(station_name)
          show_stations_for_route(chosen_route)
        end
      end
    end
  end

  #---------------Trains----------
  #--when "1"
  def create_trains
    loop do
      attempt = 0
      begin
        @interface.exit_loop_message
        train_name = @interface.user_given_train_name.capitalize
        break if train_name == 'Stop'
        attempt += 1
        train_type = @interface.user_given_train_type
        create_train(train_name, train_type)
      rescue StandardError => e
        @interface.print_exception(e)
        retry if attempt < 3
      ensure
        @interface.attempt_number(attempt)
      end
    end
  end

  def create_train(train_name, train_type)
    new_train = Train.for(train_name, train_type, @interface)
    new_train.company_name = 'RZD Moscow'
    @all_trains << new_train
    @interface.train_created_message
    @interface.train_company_name_message
    new_train.print_company_name
  end

  #--when "2"
  def set_route
    show_all_existing_trains
    show_all_existing_routes
    @interface.set_route_to_train_info_message
    if @all_trains.empty? || @all_routes.empty?
      @interface.if_all_routes_empty
      @interface.if_all_trains_empty
    else
      set_route_loop
    end
  end

  def show_all_existing_trains
    @interface.all_created_trains_message
    Train.display_all_trains(@all_trains)
  end

  def set_route_loop
    loop do
      train_name = @interface.user_given_train_name.capitalize
      break if train_name == 'Stop'
      chosen_train = Train.get_train_by_name(@all_trains, train_name)
      route_name = @interface.user_given_route_name.capitalize
      break if route_name == 'Stop'
      chosen_route = Route.get_route_by_name(@all_routes, route_name)
      if chosen_route.nil?
        @interface.route_not_found_messsage
      else
        chosen_train.set_route(chosen_route)
        @interface.route_set_message
        show_current_station(chosen_train)
      end
    end
  end

  def show_current_station(chosen_train)
    @interface.current_station
    chosen_train.current_station.name
  end

  #--when "3"
  def move_train_ahead
    loop do
      train_name = @interface.user_given_train_name.capitalize
      break if train_name == 'Stop'
      chosen_train = Train.get_train_by_name(@all_trains, train_name)
      if chosen_train.nil?
        @interface.train_not_found_messsage
      else
        chosen_train.go_to_next_station
        @interface.train_moved_message
        show_current_station(chosen_train)
      end
    end
  end

  #--when "4"
  def move_train_back
    loop do
      train_name = @interface.user_given_train_name.capitalize
      break if train_name == 'Stop'
      chosen_train = Train.get_train_by_name(@all_trains, train_name)
      if chosen_train.nil?
        @interface.train_not_found_messsage
      else
        chosen_train.go_to_prev_station
        @interface.train_moved_message
        show_current_station(chosen_train)
      end
    end
  end

  #--when "5"
  def show_all_trains_num_instances
    if @all_trains.empty?
      @interface.no_trains_message
    else
      Train.display_all_trains(@all_trains)
    end
    @interface.train_instances_number_message
  end

  #--when "6"
  def book_seat_volume
    show_all_existing_trains
    train_name = @interface.user_given_train_name.capitalize
    chosen_train = Train.get_train_by_name(@all_trains, train_name)
    total_num_carriages(chosen_train)
    carriage_num = @interface.user_given_carriage_num
    chosen_carriage = chosen_train.get_carriage_by_num(carriage_num)
    if chosen_train.is_a?(PassengerTrain)
      @interface.total_seat_number(chosen_carriage)
      @interface.free_seats(chosen_carriage)
      book_item(chosen_carriage)
      booked_free_seats(chosen_carriage)
    else
      loop do
        @interface.total_volume_number(chosen_carriage)
        @interface.free_volume(chosen_carriage)
        given_volume = @interface.book_volume_question.to_i
        break if given_volume.zero?
        book_volume(given_volume, chosen_carriage)
      end
    end
  end

  def booked_free_seats(chosen_carriage)
    @interface.free_seats(chosen_carriage)
    @interface.booked_seats(chosen_carriage)
  end

  def book_item(chosen_carriage)
    loop do
      choice = @interface.book_seat_question.capitalize
      break if choice == 'Stop'
      if chosen_carriage.free_quantity_number > 0
        chosen_carriage.book_volume
        @interface.seat_is_booked
        booked_free_seats(chosen_carriage)
      else
        @interface.no_seats_left
        break
      end
    end
  end

  def book_volume(given_volume, chosen_carriage)
    if given_volume <= chosen_carriage.free_quantity_number
      chosen_carriage.book_volume(given_volume)
      @interface.volume_is_booked
      @interface.free_volume(chosen_carriage)
      @interface.booked_volume(chosen_carriage)
    elsif chosen_carriage.free_quantity_number.zero?
      @interface.no_volume_left
    else
      @interface.left_volume_num(chosen_carriage)
    end
  end

  def total_num_carriages(chosen_train)
    @interface.total_num_carriages_message
    chosen_train.total_number_carriages
  end

  #--when "7"
  def show_train_carriages_block
    Station.display_trains_every_station do |station|
      @interface.station_name(station)
      station.trains.each do |train|
        @interface.train_name(train)
        @interface.total_num_carriages(train)
        @interface.train_type(train)
      end
    end
  end

  #---------------Carriages----------
  #--when "1"
  def create_carriages
    number_of_carriages = @interface.user_carriage_number_choice.to_i
    show_all_existing_trains
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
        carriage_number = @interface.user_given_carriage_number
        break if carriage_type.casecmp('stop').zero?
        new_carriage = create_pass_or_cargo(carriage_type, carriage_number)
        add_new_carriage(new_carriage, chosen_train)
      end
    end
  end

  def create_pass_or_cargo(carriage_type, carriage_number)
    case carriage_type
    when 'pass'
      quantity = @interface.user_given_seat_num
      PassengerCarriage.new(quantity, carriage_number, @interface)
    when 'cargo'
      quantity = @interface.user_given_volume_num
      CargoCarriage.new(quantity, carriage_number, @interface)
    else
      @interface.type_not_exist
    end
  end

  def add_new_carriage(new_carriage, chosen_train)
    @all_carriages << new_carriage
    new_carriage.company_name = 'RZD St.Peterburg'
    chosen_train.add_carriage(new_carriage)
    total_num_carriages(chosen_train)
    @interface.carriage_company_name_message
    new_carriage.print_company_name
  end

  #--when "2"
  def remove_carriage
    loop do
      show_all_existing_trains
      train_name = @interface.user_given_train_name.capitalize
      chosen_train = Train.get_train_by_name(@all_trains, train_name)
      if chosen_train.nil?
        @interface.train_not_found_messsage
      else
        carriage_number = @interface.user_carriage_remove_number.to_i
        break if carriage_number.zero?
        chosen_train.remove_carriage(carriage_number)
        total_num_carriages(chosen_train)
      end
    end
  end
end
