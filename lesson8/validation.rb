require 'pry-nav'

module Validation

  def validate(*params)
    params
  end

  def self.validate!
    # raise "Number can't be nil" if num.nil?
    # raise 'Number should be at least 5 symbols' if num.length < 5
    # raise 'Number has invalid format' if num !~ NUMBER_FORMAT
  end

  def self.valid?
    validate!
    true
  rescue StandardError
    false
  end
end
