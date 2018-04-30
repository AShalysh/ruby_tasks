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
    all_stations.each { |station| puts "#{station.name}"}
  end

  def self.get_station_by_name(all_stations, first_station_name)
    all_stations.each do |station|
      return station if station.name == first_station_name
    end  
  end

  def self.user_station_choice
    show_station_menu
    gets.chomp
  end

  def self.show_station_menu
    puts "Choose from the following:"
    puts "-- Type '1' to create a station(s)."
    puts "-- Type '2' to display the list of all stations."
    puts "-- Type '3' to display the list of all trains on the station."
    puts "-- Type '4' to go to the main menu."
    puts "-- Type '0' to exit the program."
  end
end
