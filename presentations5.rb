require 'rubygems'
require 'sinatra'
require 'pry'

class Meeting
	attr_accessor :number
	attr_accessor :name
	
	def initialize(number)
		@number = number
		@name = []
	end

	def to_s
 		"<li>The Presenter(s) for Session #{ number + 3} is/are #{ name.join(", ") }.</li>"
	end
end

class Course
	attr_reader :meetings
	attr_accessor :names

	def initialize(number_of_meetings)
		@names = %w[Daan Anne-Claire Juliana Sonja Oznur Sander Bram Frouke Tessa]
		@meetings = []
		number_of_meetings.times do |n|
			@meetings << Meeting.new(n)
		end
	end

	def populate_meetings
		number_of_presenters = @names.length / @meetings.length
		add_presenter_to_meeting("Sander", 9)
		@names.dup.each do |name|
			@meetings.shuffle!
			while @meetings[0].name.length > number_of_presenters do
				@meetings.shuffle!
			end
			@meetings[0].name << name
			@names.delete(name)
		end
		order_meetings
		puts self
	end

	def add_presenter_to_meeting(name, meeting_number)
		@meetings[meeting_number].name = [name]
		@names.delete(name)
	end

	def order_meetings
		meetings.sort_by! { |meeting| meeting.number }
	end

	def to_s
		meetings.each do |meeting|
			meeting.to_s
		end
	end
end

configure(:development) { set :session_secret, "something" }

enable :sessions

get '/' do
	@title = "Presentation Schedule"
	@course = Course.new(10)
	if session[:names]
		@course.names = session[:names].dup
	end
	@course.populate_meetings
	haml :course 
end

post '/' do
	@title = "Presentation Schedule"
	unless params[:names].empty?
		session[:names] = params[:names].split(", ") 
	end
	redirect '/'
end

__END__

@@layout
!!!
%html
	%head
		%title= @title
		%style
			body { font-family: helvetica }
	%body
		%h1= @title
		= yield

@@course
%ul= @course.to_s.join(" ")
%form{action: "/", method: "post"}
	%input{type: "text", name: "names", size: 100}
	%input{type: "submit", value: "Enter Names Separated by Comma's"}
