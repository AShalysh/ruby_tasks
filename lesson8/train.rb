class Train
  include InstanceCounter
  include Company
  extend Accessors
  include Validation
  #attr_reader :num, :speed, :route, :carriages, :train_type
  attr_accessor_with_history :num, :speed, :route, :carriages, :train_type

  @@all_created_trains = []
  @@all_created_trains_hash = {}
  
  def self.for(train_name, train_type, interface)
    case train_type
    when 'pass'
      PassengerTrain.new(train_name, interface)
    when 'cargo'
      CargoTrain.new(train_name, interface)
    else
      raise TypeError, 'Type of train is incorrect'
    end
  end

  def self.display_all_trains(all_trains)
    if all_trains.empty?
      @interface.no_trains_message
    else
      all_trains.each { |train| puts train.num.to_s }
    end
  end

  def self.find(train_number)
    @@all_created_trains_hash[train_number.to_sym]
  end

  def self.get_train_by_name(all_trains, train_name)
    all_trains.find { |train| train.num == train_name }
  end

  def initialize(num, interface)
    @num = num
    @speed = 0
    @carriages = []
    @train_type = train_type
    @interface = interface
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
      @speed.zero?
    else
      @speed -= value
    end
  end

  def add_carriage(carriage)
    if @speed.zero?
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
    if @speed.zero?
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

  def get_carriage_by_num(carriage_num)
    @carriages[carriage_num - 1]
  end

#metaprogramming
  # def <attr_name>_history
  # end

  # -------block task---------
  def display_all_carriages_by_block
    @carriages.each do |carriage|
      yield(carriage)
    end
  end

  #-----end of task ------
  # def valid?
  #   validate!
  #   true
  # rescue StandardError
  #   false
  # end

  # protected

  # # These methods are in protected because they are inner methords,
  # # no need them to be acessable from outside of the class.They are called from the inside of class
  # # I chose protected because they are child classes.
  # def validate!
  #   raise "Number can't be nil" if num.nil?
  #   raise 'Number should be at least 5 symbols' if num.length < 5
  #   raise 'Number has invalid format' if num !~ NUMBER_FORMAT
  # end

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
