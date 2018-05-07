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
    puts "Route not found"
    nil
  end

  def display_all_station_list
    if @station_list.empty?
      puts "There are no stations."
    else
      @station_list.each { |station| puts "#{station.name}" }
    end
  end

  def self.display_all_routes(all_routes)
    if all_routes.empty?
      puts "There are no routes."
    else
      all_routes.each { |route| puts "#{route.name}"}
    end
  end
end
