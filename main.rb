require './app'

app = App.new

app.welcome

loop do
  app.menu
  option = gets.chomp

  case option
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.input_person_info
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals_for_person_id
  when '7', 'q', 'quit'
    break
  end
end

puts 'Thank you for using this app!'
