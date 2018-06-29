class CargoCarriage < Carriage
  def book_volume(given_volume)
    @booked_quantity += given_volume
  end

  def free_volume_number
    @quantity - @booked_quantity
  end

  def booked_volume_number
    @booked_quantity
  end
end
