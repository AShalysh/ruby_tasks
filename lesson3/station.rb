class Station
  attr_reader :name, :trains

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

  def by_type_cargo
    @trains.select { |tr| tr.type == "cargo"}
  end

  def by_type_pass
    @trains.select { |tr| tr.type == "pass"}
  end

  def num_cargo
    by_type_cargo.count
  end

  def num_pass
    by_type_pass.count
  end
end
