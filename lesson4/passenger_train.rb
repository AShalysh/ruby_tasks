class PassengerTrain < Train
  def add_carriage(carriage)
    if carriage.is_a?(PassengerCarriage)
      super(carriage)
    else
      puts "Can't add non passenger carriage to passenger train."
    end
  end
end