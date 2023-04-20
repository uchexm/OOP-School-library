require './book'
require './rental'
require './person'

describe Book do
  before :each do
    @book = Book.new('The First Book', 'Shakir')
  end

  it 'takes two parameters and returns a Book instance' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'Check for correct title' do
    expect(@book.title).to eq('The First Book')
  end

  it 'Check for correct author' do
    expect(@book.author).to eq('Shakir')
  end

  it 'Check for rental length' do
    expect(@book.rentals.length).to eq(0)
  end

  it 'Check for add_rental method' do
    book = Book.new('The First Book', 'Shakir')
    person = Person.new(16, 'Shakir')
    rental = book.add_rental(person, '23/03.2023')
    expect(rental).to be_an_instance_of(Rental)
  end
end
