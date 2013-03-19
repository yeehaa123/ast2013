require 'pry'

class Session
  attr_accessor :number, :name, :date, :themes, :presenters
 
  def initialize(number, date)
  	@number = number
  	@name 	= name
    @date = date
		@themes = []
		@presenters = []
   end

	def to_s
		"Session #{ number } is on #{ date }, has as themes #{ themes.join(" and ") } on which #{ presenters.join(" and ")} present."
	end
end
 
class Course
  attr_reader :sessions
  attr_reader :participants
	attr_reader :themes

  def initialize(course_name)
    names = %w[Dan Ted Phil Steve Hank]
    dates = %w[02032013 09032013 16032013 23032013 30032013]
		concepts = %w[Globalism Love War Animals Art Cybernetics Technology Biology Education]
    @course_name = course_name
		@themes = concepts.map { |concept| Theme.new(concept) }
    @sessions = dates.each_with_index.map { |d,i| Session.new(i+3, dates[i]) }
    @participants = names.map { |name| Participant.new(name) }
  end
 
  def change_preference(options)
    participant = @participants.select do |p|
			p.name == options[:name]
    end
    if participant[0]
    	session_number = options[:number] 
			participant[0].preference = session_number
			puts "#{ participant[0].name }'s preference is session #{ session_number} on #{ @sessions[session_number].date }"
    else
			puts "No such participant"
    end
   end

	def populate_sessions_with_themes
		@sessions.each do |session|
			2.times { session.themes << @themes.dup.shuffle!.pop }
			puts "Session #{ session.number } has as themes #{ session.themes.join(" and ") }"
		end
	end
	
	def populate_sessions_with_presenters
		number_of_presenters = @participants.length / @sessions.length
		add_presenter_to_session("Sander", 4)
		@participants.dup.each do |participant|
			@sessions.shuffle!
			while @sessions[0].presenters.length > number_of_presenters do
				@sessions.shuffle!
			end
			@sessions[0].presenters << participant
			@participants.delete(participant)
		end
		order_sessions
	end

	def order_sessions
		@sessions.sort_by! { |session| session.number }
		@sessions.each do |s|
			puts "#{ s }"
		end
	end
	
	def add_presenter_to_session(name, session_number)
		participant = @participants.select do |p|
				p.name == name
		end
		@sessions[session_number].presenters << participant.first
		@participants.delete(participant)
	end
end
 
class Participant
  attr_accessor :preference
  attr_accessor :name
  attr_accessor :profile

  def initialize(name, preference = nil, pd = $dan_data)
    @name = name
    @profile = Profile.new(pd[:full_name], pd[:email], pd[:id]) if pd && name == "Dan"
    @preference = preference
  end
  
  def to_s
    name
  end
end

class Theme < Struct.new(:name, :description)

	def to_s
	  "#{ name }"
	end

end

class Profile < Struct.new(:full_name, :email, :id)
	
	def to_s
		"#{ full_name } #{ email } #{ id }"
	end

end

$dan_data = {
	full_name: "Dan Craig",
	email: "dan.craig@uva.nl",
	id: "101045"
}
#  
# data = Data.new("Dan Craig")

course = Course.new("Arts, Science, and Technology")
course.change_preference({name: "Dan", number: 3})
binding.pry

# ASSIGNMENT 3
#	Fix Juliana's code
#	Integrate the Profile class (DATA won't work - Ruby already has a Data class) into Participant
