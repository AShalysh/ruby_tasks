require 'pry-nav'

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validations
      @validations ||= []
    end

    def validations=(value)
      @validations = value
    end

    def validate(*params)
      self.validations = self.validations << params
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        attr_name = validation[0]
        validation_type = validation[1]

        case validation_type.to_s
        when "presence"
          raise "#{attr_name} can't be nil" if self.send(attr_name).nil?
        when "type"
          class_type = validation[2]
          raise "#{attr_name} is not type #{class_type}" if !self.send(attr_name).is_a?(class_type)
        when "format"
          regex = validation[2]
          raise "#{attr_name} does not have the correct format" if self.send(attr_name) !~ regex
        else
          raise "Validation type is incorrect"
        end
      end
      true
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

  end
 # class A; include Validation; attr_accessor :name; validate :name, :presence; validate :name, :type, String; validate :name, :format, /^[a-z0-9]{3}-?[a-z0-9]{2}$/i; end;
end
