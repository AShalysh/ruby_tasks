class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival(train)
    if !@trains.include?(train)
      @trains << train
    else
      puts "Train is already on the station."
    end
  end

  def departure(train)
    if !@trains.include?(train)
      puts "Train is not on the station."
    else
      @trains.delete(train)   
    end
  end

  def by_type(train_type)
    @trains.select { |train| train.type == train_type }
  end

  def number_by_type(train_type)
    by_type(train_type).count
  end

  def display_all_trains
    @trains.each { |train| puts "#{train.num}" }
    puts "There are no trains on the station." if @trains.empty?
  end

  def self.display_all_stations(all_stations)
    if all_stations.empty?
      puts "There are no stations."
    else
    all_stations.each { |station| puts "#{station.name}"}
    end
  end

  def self.get_station_by_name(all_stations, station_name)
    all_stations.each do |station|
      return station if station.name == station_name
    end
    puts "Station not found."
    nil
  end
end
