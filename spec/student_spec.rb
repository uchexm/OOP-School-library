require './student'
require './classroom'

describe Student do
  before :each do
    @classroom = Classroom.new('2A')
    @student = Student.new(16, 'Shakir', @classroom)
  end

  it 'checks for student class instance' do
    expect(@student).to be_an_instance_of(Student)
  end

  it 'checks for classroom class instance in student' do
    expect(@student.classroom).to be_an_instance_of(Classroom)
  end

  it 'checks for students in a classroom' do
    expect(@student.classroom.students.length).to eql(0)
  end

  it 'checks for Student Name' do
    expect(@student.name).to eql('Shakir')
  end

  it 'checks for Student Age' do
    expect(@student.age).to eql(16)
  end
end
