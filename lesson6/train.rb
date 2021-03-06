class Train
  include InstanceCounter
  include Company
  attr_reader :num, :speed, :route

  @@all_created_trains = []
  @@all_created_trains_hash = {}
  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i

  def self.for(train_name,train_type)
    case train_type
    when "pass"
      PassengerTrain.new(train_name)
    when "cargo"
      CargoTrain.new(train_name)
    else
      #puts "Train type doesn't exist." 
      raise TypeError, 'Type of train is incorrect'
    end
  end

  def self.display_all_trains(all_trains)
    if all_trains.empty?
      @interface.no_trains_message
    else
      all_trains.each { |train| puts "#{train.num}"}
    end
  end

  def self.find(train_number)
    @@all_created_trains_hash[train_number.to_sym]
  end

  def self.get_train_by_name(all_trains, train_name)
    all_trains.find { |train| train.num == train_name}
  end

  def initialize(num)
    @num = num
    @speed = 0
    @carriages = []
    validate!
    @@all_created_trains << self
    @@all_created_trains_hash[num.to_sym] = self
    register_instance
  end

  def increase_speed(value)
    @speed += value
  end

  def decrease_speed(value)
    if value > speed
      @speed = 0
    else
      @speed -= value
    end
  end

  def add_carriage(carriage)
    if @speed == 0
      @carriages << carriage
      @interface.carriage_added
    else
      @interface.stop_train_message
    end
  end

  def total_number_carriages
    puts @carriages.count
    @carriages.count
  end

  def remove_carriage(carriage_position)
    if @speed == 0
      @carriages.delete_at(carriage_position - 1)
      @interface.carriage_removed
    else
      @interface.can_not_remove_carriage
    end
  end

  def current_station
    if @route.nil?
      @interface.no_route_set
    else
      puts @route.station_list[@current_station_index].name
      @route.station_list[@current_station_index]
    end
  end

  def set_route(route)
    @route = route
    if @route.nil?
      @interface.no_such_route
    else
      @current_station_index = 0
      set_arrival
    end
  end

  def go_to_next_station
    if not_last_station
      set_departure
      @current_station_index += 1
      set_arrival
    else
      @interface.on_last_station
    end
  end
 
  def go_to_prev_station
    if not_first_station
      set_departure
      @current_station_index -= 1
      set_arrival
    else
      @interface.on_first_station
    end
  end

  def prev_station
    if not_first_station
      @route.station_list[@current_station_index - 1]
    else
      @interface.no_previous_station
    end
  end

  def next_station
    if not_last_station
      @route.station_list[@current_station_index + 1]
    else
      @interface.no_next_station
    end
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected
# я вынесла эти методы в область protected поскольку они - внутренние методы, не надо чтоб были доступны из вне класса, а вызывались внутри класса. 
# Эти методы не будут вызываться из клиенского кода. Выбрала протектед поскольку есть дети. 
  def validate!
    raise "Number can't be nil" if num.nil?
    raise "Number should be at least 5 symbols" if num.length < 5
    raise "Number has invalid format" if num !~ NUMBER_FORMAT
  end

  def set_arrival
    current_station.arrival(self)
  end

  def set_departure
    current_station.departure(self)
  end

  def not_last_station
    current_station != @route.last_station
  end

  def not_first_station
    current_station != @route.first_station
  end
end
