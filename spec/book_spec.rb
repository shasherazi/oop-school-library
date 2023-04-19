require 'rspec'
require './book'
require './rental'
require './person'

describe Book do
  before(:each) do
    @book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
  end

  context 'when creating a new book' do
    it 'should create a new book' do
      book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
      expect(book.title).to eq('The Lord of the Rings')
      expect(book.author).to eq('J.R.R. Tolkien')
    end
  end

  context 'when I call the add_rental method' do
    it 'should add a book to the rentals' do
      book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
      rental = double('rental')
      expect(rental).to receive(:book=).with(book)
      expect(book.add_rental(rental)).to eq(book)
    end
  end
end
