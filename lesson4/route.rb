class Route
  attr_reader :station_list, :name

  def initialize(name, first_station, last_station)
    @name = name
    @station_list = [first_station, last_station]
  end

  def first_station
    @station_list[0]
  end

  def last_station
    @station_list[-1]
  end

  def add_station(station)
    if !@station_list.include?(station)
      @station_list.insert(-2, station)
      puts "#{station.name} was added."
    else
      puts "Station has been already included in the route."
    end
  end

  def delete_station(station_name)
    station = get_station_by_name(station_name)
    if station && (station.name != first_station.name || station.name != last_station.name)
      @station_list.delete(station)
      puts "#{station.name} was deleted."
    else
      puts "Station is not found or it is a first/last one!"  
    end
  end

  def get_station_by_name(name)
    @station_list.each do |station|
      return station if station.name == name
    end
  end

  def self.get_route_by_name(all_routes, route_name)
    all_routes.each do |route|
      return route if route.name == route_name
    end
  end

  def display_all_stations
    @station_list.each { |station| puts "#{station.name}" }
  end

  def self.user_route_choice
    show_route_menu
    gets.chomp
  end

  def self.show_route_menu
    puts "Choose from the following:"
    puts "-- Type '1' to create a route(s)."
    puts "-- Type '2' to add a station(s) to route (between the first and last stations)."
    puts "-- Type '3' to remove a station from route."
    puts "-- Type '4' to go to the main menu."
    puts "-- Type '0' to exit the program."
  end
end
