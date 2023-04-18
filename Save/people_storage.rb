require_relative './storage'
require './student'
require './teacher'

class PeopleStorage < Storage
  def self.fetch
    return [] if File.read('./data/people.json').empty?

    people = JSON.parse(File.read('./data/people.json'))
    deserialize(people)
  end

  def self.save(people)
    File.write('./data/people.json', serialize(people).to_json)
  end

  def self.serialize(people)
    people_array = []
    people.each do |person|
      temp_hash = {
        name: person.name,
        age: person.age,
        id: person.id,
        description: person.class,
        classroom: person.instance_of?(::Student) ? person.classroom : nil,
        specialization: person.instance_of?(::Teacher) ? person.specialization : nil
      }
      people_array.push(temp_hash)
    end
    people_array
  end

  def self.deserialize(item)
    people = []
    item.each do |person|
      puts person['class']
      if person['description'] == 'Student'
        people.push(Student.new(person['age'], person['name'], person['id'], person['classroom']))
      else
        people.push(Teacher.new(person['age'], person['name'], person['id'], person['specialization']))
      end
    end
    people
  end
end
