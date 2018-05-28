module InstanceCounter
  def self.included base
    base.send :include, InstanceMethod
    base.extend ClassMethod
  end
  
  module ClassMethod 
    # def instances
    #   @@count
    # end
    def instances
      class_variable_get(:@@count)
    end
  end

  module InstanceMethod
    # def initialize
    #   register_instance
    # end
    # def register_instance
    #   @@count += 1
    # end
    
    def initialize
      register_instance
    end

    def register_instance
      class_variable_get(:@@count)
      #@@count += 1
    end
  end
end
