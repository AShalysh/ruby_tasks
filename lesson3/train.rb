#----------- Train Class ----------------------
class Train

  attr_reader :num, :type
  attr_accessor :carriage_num, :speed, :route, :current_station

  def initialize(num, type, carriage_num = 1)
    @num = num
    @type = type
    @carriage_num = carriage_num
    @speed = 0
  end

  def speed_up
    self.speed = 80
  end

  def current_speed
    puts "Current speed is #{self.speed}"
  end


  def stop
    self.speed = 0
  end

  def total_carriage_num
    puts "Total carriage number is #{self.carriage_num}"
  end

  def add_remove_carriage
    if self.speed == 0
      puts "Would you like to add or remove a carriage?"
      puts "-- Type 'add' to add a carriage."
      puts "-- Type 'remove' to remove a carriage."
      choice = gets.chomp.downcase
      case choice
      when 'add'
        self.carriage_num += 1
        puts "One carriage is added."
      when 'remove'
        self.carriage_num -= 1 
        puts "One carriage is removed."
      else
        puts "Sorry, I didn't understand you."
      end
    else 
      puts "Your speed > 0. You need to stop the train."
    end
  end

  def go_to_next_station
    next_station_position = self.route.station_list.index(self.current_station) + 1
    next_station = self.route.station_list[next_station_position]
    self.current_station.departure(self)
    next_station.arrival(next_station)
  end  
 
 def go_to_previous_station
    previous_station_position = self.route.station_list.index(self.current_station) - 1
    previous_station = self.route.station_list[previous_station_position]
    self.current_station.departure(self)
    previous_station.arrival(previous_station)
  end  

end
