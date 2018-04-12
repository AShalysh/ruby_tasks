class Station

  attr_reader :name
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival(train)
    if !@trains.include?(train)
      @trains << train
      train.current_station = self
    else
      puts "Train is already on the station."
    end
  end

  def departure(train)
    if !@trains.include?(train)
      puts "Train is not on the station."
    else
      @trains.delete(train)
      puts "Train was deleted."    
    end
  end

  def current_trains
    @trains.each do |train|
      puts "#{train} "
    end
  end

  def by_type
    counter_cargo = 0
    counter_pass = 0
    @trains.sort{|x, y| x.type <=> y.type }.each do |train|
      counter_cargo += 1 if train.type == "cargo"
      counter_pass +=1 if train.type == "pass"
      puts "Cargo train: #{train}" if train.type == "cargo"
      puts "Passanger train: #{train}" if train.type == "pass"
    end
    puts "The number of cargo trains is #{counter_cargo}"
    puts "The number of passanger trains is #{counter_pass}"
  end

end

