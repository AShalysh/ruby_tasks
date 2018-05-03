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
end
