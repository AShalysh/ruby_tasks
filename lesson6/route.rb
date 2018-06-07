class Route
  include InstanceCounter
  attr_reader :station_list, :name

  @@all_created_routes = []
  NUMBER_FORMAT = /^[a-z0-9]{2,}$/i

  def self.all
    @@all_created_routes
  end

  def self.get_route_by_name(all_routes, route_name)
    all_routes.find { |route| route.name == route_name }
  end

  def self.display_all_routes(all_routes)
    all_routes.each { |route| puts "#{route.name}" }
  end

  def initialize(name, first_station, last_station)
    @name = name
    validate!
    @station_list = [first_station, last_station]
    register_instance
    @@all_created_routes << self
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

  def display_all_station_list
    if @station_list.empty?
      puts "There are no stations."
    else
      @station_list.each { |station| puts "#{station.name}" }
    end
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected
  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name should be at least 2 characters" if name.length < 2
    raise "Name has invalid format" if name !~ NUMBER_FORMAT
  end
end
