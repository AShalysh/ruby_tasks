class Route
  attr_reader :first_station, :last_station, :station_list
  
  def initialize(first_station = Station.new("A"), last_station = Station.new("Z"))
    @station_list = [first_station, last_station]
  end

  def add_station(station)
    if !@station_list.include?(station)
      @station_list.insert(-2, station)
      puts "#{station.name} was added."
    else
      puts "Station has been already included in the route."
    end
  end

  def delete_station(station)
    if @station_list.include?(station) && station != first_station || station != last_station
      @station_list.delete(station)
      puts "#{station} was deleted."
    else
      puts "Station is not found or it is a first/last one!"  
    end
  end

  def display_all_stations
    @station_list.each do |station|
      puts "#{station.name} "
    end
  end
end
