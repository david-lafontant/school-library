require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'student'


def list_options
  puts 'Welcome to School library App!'
  puts "
    Please choose an option by entering a number:
    1- List all books
    2- List all patron
    3- Create a person
    4- Create a book
    5- Create a rental
    6- List all rentals for a given person id
    7- Exit"
end

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

def create_person(patron)
  print 'Do you want to create a student (1) or a teacher (2): '
  choice = gets.chomp
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  case choice
  when 1
    print 'Has parent permission? [Y/N]: '
    input = gets.chomp.to_i
     if input.upcase == 'Y'
      permission = true
    elsif input.upcase == 'N'
      permission = false
   else
      puts "Error"
   end
    patron.push(Student.new(age, name: name, parent_permission: permission))
  when 2
    print 'Specialization: '
    specialization = gets.chomp.to_i
    patron.push(Teacher.new(specialization, age, name))
  end
  puts 'Person created successfully.'
end