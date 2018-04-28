class CargoTrain < Train
	def add_carriage(carriage)
		if carriage.is_a?(CargoCarriage)
			super(carriage)
		else
			puts "Can't add non cargo carriage to cargo train."
		end
	end
end