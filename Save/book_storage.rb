require 'json'
require_relative './storage'

class BookStorage < Storage
  def fetch; end

  def self.save(books)
    serialize(books)
  end

  def self.serialize(books)
    books_array = []
    books.each do |book|
      temp_hash = {
        title: JSON.generate(book.title),
        author: JSON.generate(book.author)
      }
      books_array.push(temp_hash)
    end
    books_array
  end

  def deserialize(books); end
end
