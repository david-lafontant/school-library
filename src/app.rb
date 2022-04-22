require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'

def options(books, patron, rentals)
  loop do
    list_options
    option = gets.chomp.to_i
    case option
    when 1
      books_list(books)
    when 2
      patrons_list(patron)
    when 3
      create_person(patron)
    when 4
      create_book(books)
    when 5
      create_rental(books, patron, rentals)
    when 6
      rental_list_by_id(rentals)
    else
      break
    end
  end
end