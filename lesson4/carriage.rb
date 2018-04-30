class Carriage	
	def initialize
	end

	def self.for(type)
		case type
		when "pass"
			PassengerCarriage.new
		when "cargo"
			CargoCarriage.new
		else
			puts "Carriage type doesn't exist."	
		end	
	end

	def user_carriage_choice
		show_carriage_menu
		gets.chomp
	end	

	def show_carriage_menu
		puts "Choose from the following:"
	    puts "-- Type '1' to create a carriage."
	    puts "-- Type '2' to add a carriage to train."
	    puts "-- Type '3' to remove a carriage from train."
	    puts "-- Type '4' to go to the main menu."
	    puts "-- Type '0' to exit the program."
	end
end
