class PassengerTrain < Train
  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i
  validate :num, :presence
  validate :num, :format, NUMBER_FORMAT
  validate :num, :type, String

  def add_carriage(carriage)
    if carriage.is_a?(PassengerCarriage)
      super(carriage)
    else
      @interface.non_passenger_carriage
    end
  end
end
