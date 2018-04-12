#----------- Route Class ----------------------
class Route
  attr_reader :first_station
  attr_reader :last_station
  attr_accessor :station_list
  
#first_station = "A", last_station = "Z"
  def initialize(first_station = Station.new("A"), last_station = Station.new("Z"))
    @station_list = []
    @first_station = first_station
    @last_station = last_station
    @station_list.insert(0, @first_station)
    @station_list.insert(-1, @last_station)
  end

  def add_station(station)
    if !@station_list.include?(station)
      @station_list.insert(-2, station)
      puts "#{station.name} was added."
    else     
      puts "Station already exists!"
    end
  end

  def delete_station(station)
    if !@station_list.include?(station)
      puts "Station is not found!"
    else
      @station_list.delete(station)
      puts "#{station} was deleted."
     end
  end

  def display_all_stations
    @station_list.each do |station|
      puts "#{station.name} "
    end
  end

end
