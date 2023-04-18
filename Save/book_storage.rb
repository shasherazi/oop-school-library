require 'json'
require_relative './storage'
require './book'

class BookStorage < Storage
  def self.fetch
    books = JSON.parse(File.read('./data/books.json'))
    deserialize(books)
  end

  def self.save(books)
    File.write('./data/books.json', serialize(books).to_json)
  end

  def self.serialize(books)
    books_array = []
    books.each do |book|
      temp_hash = {
        title: book.title,
        author: book.author
      }
      books_array.push(temp_hash)
    end
    books_array
  end

  def self.deserialize(books)
    temp = []
    books.each do |book|
      new_book = Book.new(book['title'], book['author'])
      temp.push(new_book)
    end
    temp
  end
end
