module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @instances ||= 0
    end

    def instances=(value)
      @instances = value
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances += 1
    end
  end
  # def self.included base
  #   base.extend ClassMethod
  #   base.send :include, InstanceMethod
  # end
  
  # module ClassMethod 
  #   def instances
  #     class_variable_get(:@@count)
  #   end

  #   def register_instance
  #     count = class_variable_get(:@@count)
  #     class_variable_set(:@@count, count+1)  
  #   end
  # end

  # module InstanceMethod
  #   def initialize
  #     register_instance
  #   end

  #   protected
  #   def register_instance
  #     self.class.register_instance
  #   end
  # end
end
