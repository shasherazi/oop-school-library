require 'json'
require_relative './storage'
require './rental'
require './Save/book_storage'
require './Save/people_storage'

class RentalStorage < Storage
  @rentals = []

  class << self
    attr_accessor :rentals
  end

  def self.fetch
    rentals = if File.exist?('./data/rentals.json')
                JSON.parse(File.read('./data/rentals.json'))
              else
                []
              end
    deserialize(rentals)
  end

  def self.save(rentals)
    rentals.each do |rental|
      RentalStorage.rentals.push(serialize(rental))
    end

    File.write('./data/rentals.json', JSON.pretty_generate(RentalStorage.rentals))
  end

  def self.serialize(rental)
    {
      date: rental.date,
      book: BookStorage.serialize(rental.book),
      person: PeopleStorage.serialize(rental.person)
    }
  end

  def self.deserialize(item)
    temp = []
    item.each do |rental|
      person = PeopleStorage.deserialize([rental['person']])
      book = BookStorage.deserialize([rental['book']])
      rental = Rental.new(rental['date'], book, person)
      temp.push(rental)
    end
    temp
  end
end
