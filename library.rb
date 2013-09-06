class Book
	attr_accessor :title, :author, :desc, :status, :due_date
	def initialize(title, author, desc)
		@title = title
		@author = author
		@desc	= desc
		@status = "available"
		@due_date = nil
	end

	def overdue?
		@due_date < Time.now
	end
end

class User
	attr_accessor :first_name, :last_name, :checked_out_books
		
	def initialize(first_name,last_name)
		@first_name = first_name
		@last_name = last_name
		@checked_out_books = []
	end

	def book_count()
		@checked_out_books.length
	end

	def borrow(book)
		@checked_out_books << book
	end
end

class Library
	
	def initialize()
		@books = []	
	end

	def add(book)
		 @books << book
	end

	def status(book)
		if book.status == "available"
			puts "#{book.title} is not checked out."
		else
			puts "#{book.title} is checked out. Please try again later."		
		end 
	end

	def check_out(book,user)
		if user.book_count > 2
			puts "Sorry! You can't check out any more books."
		elsif user.checked_out_books.each { |book| book.overdue? == true}
			puts "Sorry! You have an overdue book."
		elsif book.status == "available" 
			book.due_date = Time.now + (7*24*3600)
			user.borrow(book)
      book.status = "checked out"
			puts "You have checked out #{book.title}."
		else 
			puts "#{book.title} is checked out. Please check back soon."
		end
	end
	
	def check_in(book,user)
		if book.status == "available"
			puts "This book is not available for check in."
		else 
			user.checked_out_books.delete(book)
      book.status = "available"	
			puts "Thank you! #{book.title} is now checked in."
		end
	end

	def get_book_info(book)
    if book.status = available
		  puts "#{book.title} is currently available"
    else 
      puts "#{book.title} is currently checked out by #{user.checked_out_books} and is due in #{due_date} seconds"
	   end
   end
   
   def get_user_info(user)
    user.checked_out_books.each {|book| puts book.overdue}
  end
end
