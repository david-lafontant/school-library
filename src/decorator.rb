class Nameable
    def correct_name
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end

class Decorator < Nameable
    attr_accessor :name
  
    def initialize(name)
      super()
      @name = name
    end
  
    def correct_name
      @name.correct_name
    end
  end