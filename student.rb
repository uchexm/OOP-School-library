require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, parent_permission, name = 'Unknown', id = Random.rand(1..1000))
    super(age, name, id)
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
