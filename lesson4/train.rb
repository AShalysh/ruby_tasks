class Train
  attr_reader :num, :speed, :route

  def initialize(num)
    @num = num
    @speed = 0
    @carriages = []
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
    @carriages.count
  end

  def remove_carriage(carriage_position)
    if @speed == 0 && carriage_position <= total_number_carriages && total_number_carriages != 0
      @carriages.delete_at(carriage_position - 1)
      puts "This carriage is removed."
    else
      puts "Can not remove the carriage because: " 
      puts "1) Your speed > 0; 2) the carriage number is greater than the number of total carriages; 3)Train does not have any carriages."
    end
  end

  def current_station
    @route.station_list[@current_station_index]
  end 

  def set_route(route)
    @route = route
    @current_station_index = 0
    set_arrival
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

  def self.for(train_name,train_type)
    case train_type
    when "pass"
      PassengerTrain.new(train_name)
    when "cargo"
      CargoTrain.new(train_name)
    else
      puts "Carriage type doesn't exist." 
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