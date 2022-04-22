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
  choice = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  case choice
  when 1
    print 'Has parent permission? [Y/N]: '
    input = gets.chomp
    case input.upcase
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end
    patron.push(Student.new(age, name: name, parent_permission: permission))
  when 2
    print 'Specialization: '
    specialization = gets.chomp.to_i
    patron.push(Teacher.new(specialization, age, name))
  end
  puts 'Person created successfully.'
end

def create_rental(books, rentals, patron)
  puts 'Select a book from the following list by number'
  books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
  book_input = gets.chomp.to_i

  puts 'Select a person from the following list by number (Not ID): '
  patron.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end
  person_input = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp

  rentals.push(Rental.new(date, patron[person_input], books[book_input]))
  puts 'Rental created successfully.'
end

def create_book(books)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  books.push(Book.new(title, author))
  puts 'Book created successfully.'
end

def patrons_list(patrons)
  patrons.each { |patron| puts "[#{patron.class}] Name: #{patron.name}, ID: #{patron.id}, Age: #{patron.age}" }
end

def rental_list_by_id(rentals)
  print 'ID of person: '
  person_id = gets.chomp.to_i
  rentals.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
  end
end

def books_list(books)
  books.each { |book| puts "Title '#{book.title}', Author #{book.author}" }
end
