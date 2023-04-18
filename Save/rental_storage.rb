require 'json'
require_relative './storage'
require './rental'
require './Save/book_storage'

class RentalStorage < Storage
  def self.fetch
    rentals = JSON.parse(File.read('./data/rentals.json'))
    deserialize(rentals)
  end

  def self.save(rentals)
    File.write('./data/rentals.json', serialize(rentals).to_json)
  end

  def self.serialize(rentals)
    rentals_array = []
    rentals.each do |rental|
      temp_hash = {
        date: rental.date,
        book: BookStorage.serialize(rental.book),
        person: rental.person
      }
      rentals_array.push(temp_hash)
    end
    rentals_array
  end

  def self.deserialize(item)
    temp = []
    item.each do |rental|
      new_rental = Rental.new(rental['date'], rental['book'], rental['person'])
      temp.push(new_rental)
    end
    temp
  end
end
