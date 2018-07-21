class Route
  include InstanceCounter
  attr_reader :station_list, :name

  @@all_created_routes = []
  NAME_FORMAT = /^[a-z0-9]{2,}$/i

  def self.all
    @@all_created_routes
  end

  def self.get_route_by_name(all_routes, route_name)
    all_routes.find { |route| route.name == route_name }
  end

  def self.display_all_routes(all_routes)
    all_routes.each { |route| puts route.name.to_s }
  end

  def initialize(name, first_station, last_station, interface)
    @name = name
    @station_list = [first_station, last_station]
    @interface = interface
    validate!
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
      @interface.station_was_added
    else
      @interface.station_included_in_route
    end
  end

  def delete_station(station_name)
    station = get_station_by_name(station_name)
    if station && (station.name != first_station.name || station.name != last_station.name)
      @station_list.delete(station)
      @interface.station_was_deleted
    else
      @interface.station_not_found
    end
  end

  def get_station_by_name(name)
    @station_list.each do |station|
      return station if station.name == name
    end
  end

  def display_all_station_list
    if @station_list.empty?
      @interface.no_stations_message
    else
      @station_list.each { |station| puts station.name.to_s }
    end
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name should be at least 2 characters" if name.length < 2
    raise "Name has invalid format" if name !~ NAME_FORMAT
    raise "1st and Last st.cannt be thesame,must belong to cl.St" if first_station == last_station
    raise "1st station isn't an obj.of cl.Station" unless first_station.is_a?(Station)
    raise "Last station isn't an obj.of cl.Station" unless last_station.is_a?(Station)
  end
end
