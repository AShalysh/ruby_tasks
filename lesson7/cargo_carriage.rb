class CargoCarriage < Carriage
  def book_volume(given_volume)
    @booked_quantity += given_volume
  end
end
