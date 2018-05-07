require 'pry-nav'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'interface'
require_relative 'main_interface'

interface = Interface.new
main_interface = MainInterface.new(interface)
main_interface.start
