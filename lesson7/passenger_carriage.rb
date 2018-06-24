class PassengerCarriage < Carriage
  def book_seat
    @quantity -= 1
    @booked_quantity += 1
  end

  def free_seats_number
    puts @quantity
    @quantity
  end

  def booked_seats_number
    puts @booked_quantity
    @booked_quantity
  end
end
