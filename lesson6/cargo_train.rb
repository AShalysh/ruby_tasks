class CargoTrain < Train
  def add_carriage(carriage)
    if carriage.is_a?(CargoCarriage)
      super(carriage)
    else
      @interface.non_cargo_carriage
    end
  end
end
