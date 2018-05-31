class Train
  include InstanceCounter
  include Company
  attr_reader :num, :speed, :route

  @@all_created_trains = []

  def self.all
    @@all_created_trains
  end

  def self.for(train_name,train_type)
    case train_type
    when "pass"
      PassengerTrain.new(train_name)
    when "cargo"
      CargoTrain.new(train_name)
    else
      puts "Train type doesn't exist." 
    end 
  end

  def self.display_all_trains(all_trains)
    if all_trains.empty?
      puts "There are no trains."
    else
      all_trains.each { |train| puts "#{train.num}"}
    end
  end
#self.find сделан также как и следующий метод, только название -фаинд потому что в задание было указано дать такое имя. self.get_train_by_name - такой же метод, но я его сделала раньше и использую в программе, поэтому не удаляю.
  def self.find(all_trains, train_number)
    all_trains.find { |train| train.num == train_number}
  end

  def self.get_train_by_name(all_trains, train_name)
    all_trains.find { |train| train.num == train_name}
  end

  def initialize(num)
    @num = num
    @speed = 0
    @carriages = []
    @@all_created_trains << self
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
      puts "Carriage is added."
    else
      puts "Your speed > 0. You need to stop the train."
    end
  end

  def total_number_carriages
    puts @carriages.count
    @carriages.count
  end

  def remove_carriage(carriage_position)
    if @speed == 0 
      @carriages.delete_at(carriage_position - 1)
      puts "This carriage is removed."
    else
      puts "Can not remove the carriage because: " 
      puts "1) Your speed > 0; 2) Train does not have this carriage."
    end
  end

  def current_station
    if @route.nil?
      puts "No route set"
    else  
      puts @route.station_list[@current_station_index].name 
      @route.station_list[@current_station_index]
    end
  end 

  def set_route(route)
    @route = route
    if @route.nil?
      puts "There is no such root."
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
      puts "You are on the last station."
    end
  end
 
  def go_to_prev_station
    if not_first_station
      set_departure
      @current_station_index -= 1
      set_arrival
    else
      puts "You are on the first station."
    end
  end

  def prev_station
    if not_first_station
      @route.station_list[@current_station_index - 1]
    else 
      puts "There is no previous station."
    end
  end

  def next_station
    if not_last_station
      @route.station_list[@current_station_index + 1]
    else
      puts "There is no next station."
    end
  end

  protected
# я вынесла эти методы в область protected поскольку они - внутренние методы, не надо чтоб были доступны из вне класса, а вызывались внутри класса. 
# Эти методы не будут вызываться из клиенского кода. Выбрала протектед поскольку есть дети. 
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
