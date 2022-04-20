require_relative 'decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end


   def of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private :of_age?
  public :can_use_services?
end
