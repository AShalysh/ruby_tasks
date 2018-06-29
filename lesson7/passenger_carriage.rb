class PassengerCarriage < Carriage
  def book_seat
    @booked_quantity += 1
  end

  def free_seats_number
    @quantity - @booked_quantity
  end

  def booked_seats_number
    @booked_quantity
  end
end
