require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', id = Random.rand(1..1000))
    binding.pry
    #I switched the specialization with age
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
