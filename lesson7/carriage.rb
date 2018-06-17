class Carriage
  include Company
  attr_reader :quantity
  def initialize(quantity, interface)
    @quantity = quantity
    @interface = interface
    @booked_quantity = 0
  end

  def total_quantity
    puts @quantity + @booked_quantity
    @quantity + @booked_quantity
  end
end
