require 'json'
require_relative './storage'
require './book'

class BookStorage < Storage
  @@books = []

  def self.fetch
    books = if File.exist?('./data/books.json')
              JSON.parse(File.read('./data/books.json'))
            else
              []
            end
    deserialize(books)
  end

  def self.save(books)
    for book in books
      @@books.push(serialize(book))
    end

    File.write('./data/books.json', JSON.pretty_generate(@@books))
  end

  def self.serialize(book)
    {
      title: book.title,
      author: book.author
    }
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
