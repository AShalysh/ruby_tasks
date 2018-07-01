class Carriage
  include Company
  attr_reader :quantity, :carriage_number, :booked_quantity

  def initialize(quantity, carriage_number, interface)
    @quantity = quantity
    @interface = interface
    @booked_quantity = 0
    @carriage_number = carriage_number
  end

  def free_quantity_number
    @quantity - @booked_quantity
  end
end
