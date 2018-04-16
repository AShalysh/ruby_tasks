class Train
  attr_reader :num, :type, :carriage_num, :speed, :route, :current_station

  def initialize(num, type, carriage_num = 1)
    @num = num
    @type = type
    @carriage_num = carriage_num
    @speed = 0
    @current_station = 0
  end

  def increase_speed(value)
    @speed += value
  end

  def current_speed
    @speed
  end

  def decrease_speed(value)
    if value > speed
      @speed = 0
    else   
      @speed -= value
    end
  end
#это же значение будет возвращать reader :carriage_num
  def total_carriage_num
    @carriage_num
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

  def set_route(route)
    @route = route
  end

  def train_route
    @current_station = @route.station_list[0]
  end

  def go_to_next_station
    next_station_position = @route.station_list.index(@current_station) + 1
    next_station = @route.station_list[next_station_position]
    @current_station.departure(self)
    next_station.arrival(next_station)
    @current_station = next_station
  end
 
  def go_to_prev_station
    previous_station_position = @route.station_list.index(@current_station) - 1
    previous_station = @route.station_list[previous_station_position]
    @current_station.departure(self)
    previous_station.arrival(previous_station)
    @current_station = previous_station
  end

  def current_station
    @current_station
  end

  def prev_station
    previous_station_position = @route.station_list.index(@current_station) - 1
    previous_station = @route.station_list[previous_station_position]
  end

  def next_station
    next_station_position = @route.station_list.index(@current_station) + 1
    next_station = @route.station_list[next_station_position]
  end
end
