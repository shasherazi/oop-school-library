require './create'
require './book'
class CreateBook < Create
  def create
    puts 'Please enter the title of the book'
    title = gets.chomp
    puts 'Please enter the author of the book'
    author = gets.chomp
    puts 'Please enter the age range of the book'
    age_range = gets.chomp
    book = Book.new(title: title, author: author, age_range: age_range)
    @books << book
    puts 'Book created successfully'
  end
end
