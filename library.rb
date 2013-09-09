
# Internal: The book class contains information regarding a book's attributes such as title, author. 
class Book
	attr_accessor :title, :author, :desc, :status, :due_date
	def initialize(title, author, desc)
		@title = title
		@author = author
		@desc	= desc
		@status = "available"
		@due_date = []
	end
# Check if a book is overdue 
#
# overdue - A Boolean value from a comparison of a book's due_date and the current date. 
#
# Examples 
#
#  
	def overdue? ()
		@due_date < Time.now
    end
end

# Internal: The User class contains information regarding a library user. This is used to track the books used by each person. 
class User
	attr_accessor :first_name, :last_name, :checked_out_books
		
	def initialize(first_name,last_name)
		@first_name = first_name
		@last_name = last_name
		@checked_out_books = []
	end
# Count how many books a user has checked out. 
#
#book_count - stores a number of checked out books. 
#
# Examples:
#      me.book_count()
# ->   "0" 
# Returns a number.     
	def book_count()
		@checked_out_books.length
	end
# Adding a book the user checked out to track the check out history for each user. 
#
#borrow(book) - Adds a book to the checked_out_books array for that user. 
#
# Example: 
#
#   me.borrow(book2)
# => [book1,book2]
# Returns an array.
	def borrow(book)
		@checked_out_books << book
	end
end
# Internal: The library class contains information regarding the functions of the library. The library class contains important methods that allow users and books to interact. 
class Library
	
	def initialize()
		@books = []	
	end
# Adds a book to the book list.
#
#lib.add(book) - Adds a book to the end of the books array.
# 
# Example
#
# lib.add(book2)
# => @books = [book1,book2]
# Returns an array. 
	def add(book)
		 @books << book
	end
# Returns library book's availability.
#
# lib.status(book) - Returns message regarding the book's avaialabiltiy after checking the book variable status. 
#
#Example
#
#   lib.status(book1)
# => "Book 1 is not checked out."
#Returns a string message. 
	def status(book)
		if book.status == "available"
			puts "#{book.title} is not checked out."
		else
			puts "#{book.title} is checked out. Please try again later."		
		end 
	end
# Documents a book transaction.
#
# lib.check_out(book,user) - Checks out the specified book and user which is changing the book's stautus. 
#
#Example
#
#   lib.check_out(book1,me)
# => "Sorry! You can't check out any more books."
# 
# Returns a string message but updates book and user property variables for tracking purposes. 
	def check_out(book,user)
		if user.book_count > 2
			puts "Sorry! You can't check out any more books."
		elsif user.checked_out_books.any? { |book| book.overdue? == true}
			puts "Sorry! You have an overdue book."
		elsif book.status == "available" 
			book.due_date = Time.now + (7*24*3600)
      user.checked_out_books << book
			user.borrow(book)
      book.status = "checked out"
			puts "You have checked out #{book.title}."
		else 
			puts "#{book.title} is checked out. Please check back soon."
		end
	end
# Documents a book transaction.
#
# lib.check_in(book,user) - Checks in the specified book and updates user property variable which is changing the book's stautus. 
#
#Example
#
#   lib.check_out(book1,me)
# => "Sorry! You can't check out any more books."
# 
# Returns a string message but updates book and user property variables for tracking purposes. 
	def check_in(book,user)

		if book.status == "available"
			puts "This book is not available for check in."
		else 
			user.checked_out_books.delete(book)
      book.status = "available"	
			puts "Thank you! #{book.title} is now checked in."
		end
	end
# Outputs information requested by book.
#
# lib.get_book_info(book) - Lets the user know if a book is available for check out.  
#
#Example
#
#   lib.get_book_info(book1)
# => "Book 1 is currently available"
# 
# Returns a string message to inform user if a book is available for check out. 
	def get_book_info(book)
    if book.status = available
		  puts "#{book.title} is currently available"
    else 
      puts "#{book.title} is currently checked out by #{user.checked_out_books} and is due in #{due_date} seconds"
	   end
   end
# Outputs information requested by user.
#
# lib.get_user_info(book) - Lets the user know if they have any overdue books.  
#
#Example
#
#   lib.get_user_info(me)
# => "You have no overdue books"
# 
# Returns either an array of overdue books by user or message saying the user does not have any overdue books. 
   def get_user_info(user)
    if user.checked_out_books.any? {|book| book == true}
        puts book.overdue > Time.now
    else puts "You have no overdue books."
    end
  end
end
