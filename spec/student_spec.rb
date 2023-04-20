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

  it 'checks for addition of a classroom instance' do
    @classroom2 = Classroom.new('2C')
    @student = Student.new(16, 'Shakir', @classroom2)
    @student.add_classroom(@classroom2)
    expect(@classroom2.students).to include(@student)
  end

  it 'checks for hokey function' do
    expect(@student.play_hooky).to eql('¯\\_(ツ)_/¯')
  end
end
