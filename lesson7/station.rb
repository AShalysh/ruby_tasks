class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@all_created_stations = []
  NAME_FORMAT = /^[a-z0-9]{2,}$/i

  def self.all
    @@all_created_stations
  end

  def self.display_all_stations(all_stations)
    all_stations.each { |station| puts "#{station.name}" }
  end

  def self.get_station_by_name(all_stations, station_name)
    all_stations.find { |station| station.name == station_name }
  end

  def initialize(name, interface)
    @name = name
    @trains = []
    @interface = interface
    validate!
    @@all_created_stations << self
    register_instance
  end

  def arrival(train)
    if !@trains.include?(train)
      @trains << train
    else
      @interface.train_on_station
    end
  end

  def departure(train)
    if !@trains.include?(train)
      @interface.train_not_on_station
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
    @interface.no_trains_on_station if @trains.empty?
  end
  # -------block task---------
  def display_all_trains_by_block
    @interface.no_trains_on_station if @trains.empty?
    @trains.each do |train| 
      yield(train)
    end
  end

  def self.display_trains_every_station
    @@all_created_stations.each do |station|
      yield(station)
    end
  end
  #-----end of task ------
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
    raise "Name has invalid format" if name !~ NAME_FORMAT
  end
end
