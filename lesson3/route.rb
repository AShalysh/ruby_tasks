class Route
  attr_reader :station_list

  def initialize(first_station, last_station)
    @station_list = [first_station, last_station]
  end

  def first_station
    first_station = @station_list[0]
  end

  def last_station
    last_station = @station_list[-1]
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
    if @station_list.include?(station) && (station != first_station || station != last_station)
      @station_list.delete(station)
      puts "#{station} was deleted."
    else
      puts "Station is not found or it is a first/last one!"  
    end
  end

  def display_all_stations
    @station_list.each { |station| puts "#{station.name}" }
  end
end
