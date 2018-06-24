class CargoCarriage < Carriage
  def book_volume(given_volume)
    @quantity -= given_volume
    @booked_quantity += given_volume
  end

  def free_volume_number
    puts @quantity
    @quantity
  end

  def booked_volume_number
    puts @booked_quantity
    @booked_quantity
  end
end
