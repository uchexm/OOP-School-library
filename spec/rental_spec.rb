require './rental'
require './person'
require './book'

describe Rental do
  before :each do
    @book = Book.new('The First Book', 'Shakir')
    @person = Person.new(16, 'Shakir')
    @rental = Rental.new('03/05/2023', @person, @book)
  end

  it 'checks for rental class instance' do
    expect(@rental).to be_an_instance_of(Rental)
  end

  it 'checks for book class instance in rental' do
    expect(@rental.book).to be_an_instance_of(Book)
  end

  it 'checks for person class instance in rental' do
    expect(@rental.person).to be_an_instance_of(Person)
  end

  it 'checks for no of rentals of a person' do
    expect(@rental.person.rentals.length).to eql(1)
  end

  it 'checks for no of rentals of a book' do
    expect(@rental.book.rentals.length).to eql(1)
  end

  it 'check for rental date' do
    expect(@rental.date).to eql('03/05/2023')
  end
end
