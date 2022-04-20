class Nameable
  def correct_name
    raise NotImplementedError
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

class CapitalizeDecorator < Decorator
  def correct_name
    @name.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    if @name.correct_name.length > 10
      @name.correct_name.slice(0, 10)
    else
      @name.correct_name
    end
  end
end
