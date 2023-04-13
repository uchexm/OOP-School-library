require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
  end

  def create_person
    print 'To create a student press (1) and Press (2) to create a Teacher: '
    response = gets.chomp
    while response != '1' && response != '2'
      print 'Invalid Option! Kindly press 1 or 2:'
      response = gets.chomp
    end
    print 'What is your name?: '
    name = gets.chomp
    print 'How old are you?: '
    age = gets.chomp

    who_to_create(response, name, age)
    puts 'Successful'
  end

  def create_book
    print 'Enter book Title: '
    title = gets.chomp
    print 'Enter Book Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created succesfully!!!'
  end

  def create_rental
    puts 'Select book you want to rent by ID: '
    @books.each_with_index do |book, index|
      puts "#{index}) #{book.title} By #{book.author}"
    end
    book_index = gets.chomp.to_i

    book = @books[book_index]
    puts 'Select the person by ID: '
    @people.each_with_index do |person, index|
      type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "#{index}) [#{type}] Name: #{person.name} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i

    person = @people[person_index]

    Rental.new(person, book)
    puts 'Rented successfully'
  end

  def view_rental
    puts 'Please type in the persons ID: '
    id = gets.chomp.to_i
    @people.each do |person|
      if person.id == id
        return person.rental.map do |e|
          "Book: #{e.book.title} Rented By: #{person.name} On: #{e.date}"
        end
      end
    end

    'No books rented'
  end

  private

  def who_to_create(input, name, age)
    if input == '1'
      print 'Enter classroom: '
      classroom = gets.chomp
      print 'Enter parent permision y/n: '
      perm = gets.chomp
      while perm != 'y' && perm != 'n'
        print 'Please enter parent permision y/n: '
        perm = gets.chomp.downcase
      end
      perm = perm == 'y'
      student = Student.new(age, classroom, perm, name)
    else
      print 'Enter specialization: '
      specialization = gets.chomp
      student = Teacher.new(age, specialization, name)
    end
    @people.push(student)
  end
end