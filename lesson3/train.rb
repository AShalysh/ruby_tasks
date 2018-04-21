class Train
  attr_reader :num, :type, :carriage_num, :speed, :route

  def initialize(num, type, carriage_num = 1)
    @num = num
    @type = type
    @carriage_num = carriage_num
    @speed = 0
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

  def add_carriage
    if @speed == 0
      @carriage_num += 1
      puts "One carriage is added."
    else
      puts "Your speed > 0. You need to stop the train."
    end
  end

  def remove_carriage
    if @speed == 0 && @carriage_num >= 2
      @carriage_num -= 1
      puts "One carriage is removed."
    else
      puts "Your speed > 0 or the amount of carriages == 1"
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
end
