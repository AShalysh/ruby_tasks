class PassengerCarriage < Carriage
  def book_seat
    @booked_quantity += 1
  end
end
