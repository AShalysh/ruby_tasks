class PassengerCarriage < Carriage
  def book_seat
    loop do
      @interface.book_seat_question
      choice = gets.chomp.downcase
      break if choice == "stop"
      if @quantity > 0
        @quantity -= 1
        @booked_quantity += 1
        @interface.seat_is_booked
        @interface.free_seats
        free_seats_number
        @interface.booked_seats
        booked_seats_number
      else
        @interface.no_seats_left
        break
      end
    end
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
