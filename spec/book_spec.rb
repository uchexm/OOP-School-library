require './book'

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
end
