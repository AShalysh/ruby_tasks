module InstanceCounter
  def self.included base
    base.send :include, InstanceMethod
    base.extend ClassMethod
  end
  
  module ClassMethod 
    def instances
      @@count
    end
  end

  module InstanceMethod
    def initialize
      @@count = 0
    end

    private 
    def register_instance
      @@count += 1
    end
  end
end
