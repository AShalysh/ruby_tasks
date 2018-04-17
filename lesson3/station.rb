class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival(train)
    if !@trains.include?(train)
      @trains << train
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

  def by_type(train_type)
    @trains.select { |train| train.type == train_type}
  end

  def number_by_type(train_type)
    by_type.count
  end
end
