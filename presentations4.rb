class Session
	attr_accessor :number
	attr_accessor :name
	
	def initialize(number)
		@number = number
		@name = []
	end

	def to_s
 		"The Presenter(s) for Session #{ number } is/are #{ name }."
	end
end

class Course
	attr_reader :sessions
	def initialize(number_of_sessions)
		@names = %w[Dan Ted Phil Steve Hank Rick Don Sam]
		@sessions = []
		number_of_sessions.times do |n|
			@sessions << Session.new(n)
		end
	end

	def populate_sessions
		number_of_presenters ||= @names.length / @sessions.length
		add_presenter_to_session("Sam", 0)
		@names.dup.each do |name|
			@sessions.shuffle!
			while @sessions[0].name.length > number_of_presenters do
				@sessions.shuffle!
			end
			@sessions[0].name << name
			@names.delete(name)
		end
		order_sessions
		puts self
	end

	def add_presenter_to_session(name, session_number)
		@sessions[session_number].name = [name]
		@names.delete(name)
	end

	def order_sessions
		sessions.sort_by! { |session| session.number }
	end

	def to_s
		sessions.each do |session|
			puts session
		end
	end
end
