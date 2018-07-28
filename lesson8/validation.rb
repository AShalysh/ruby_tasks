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

    def validate(*params)
      self.validations << {name: params[0], type: params[1], extra: params[2]}
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        attr_name = validation[:name]
        self.send("#{validation[:type]}_validate!", { name: attr_name, value: self.send(attr_name), extra: validation[:extra] })
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def presence_validate!(params)
      raise "#{params[:name]} can't be nil" if params[:value].nil?
    end

    def type_validate!(params)
      raise "#{params[:name]} is not type #{params[:extra]}" if !params[:value].is_a?(params[:extra])
    end

    def format_validate!(params)
      raise "#{params[:name]} does not have the correct format" if params[:value] !~ params[:extra]
    end
  end
 # class A; include Validation; attr_accessor :name; validate :name, :presence; validate :name, :type, String; validate :name, :format, /^[a-z0-9]{3}-?[a-z0-9]{2}$/i; end;
end
