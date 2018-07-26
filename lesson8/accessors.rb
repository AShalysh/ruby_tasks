module Accessors
  def attr_accessor_with_history(*names)
    attr_reader_without_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_history_name = "@#{name}_history".to_sym
      puts "******* 1 self: #{self}"
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        puts "******* 2 self: #{self}"
        history_array = instance_variable_get(var_history_name)
        history_array = [] if history_array.nil? 
        history_array << value
        instance_variable_set(var_history_name, history_array)
      end
      define_method(name) { instance_variable_get(var_name) }
      attr_reader_without_history("#{name}_history")
    end
  end

  def attr_reader_without_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
    end
  end

  def strong_attr_accessor(*names, attr_class)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        if name.is_a?(attr_class)
          instance_variable_set(var_name, value)
        else
          raise "Wrong class."
        end
      end
    end
  end
end
