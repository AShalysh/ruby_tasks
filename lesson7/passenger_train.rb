class PassengerTrain < Train
  def add_carriage(carriage)
    if carriage.is_a?(PassengerCarriage)
      super(carriage)
    else
      @interface.non_passenger_carriage
    end
  end
end
