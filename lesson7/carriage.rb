class Carriage
  include Company
  attr_reader :quantity, :carriage_number

  def initialize(quantity, carriage_number, interface)
    @quantity = quantity
    @interface = interface
    @booked_quantity = 0
    @carriage_number = carriage_number
  end

  def total_quantity
    puts @quantity + @booked_quantity
    @quantity + @booked_quantity
  end
end
