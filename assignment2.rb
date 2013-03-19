require 'pry'

class Session
  attr_accessor :number, :name, :date, :themes
 
  def initialize(number, date)
  	@number = number
  	@name 	= name
        @date = date
	@themes = []
   end
end
 
class Course
  attr_reader :participants, :sessions

  def initialize(course_name)
    @course_name = course_name
    names = %w[Dan Ted Phil Steve Hank]
    dates = %w[02032013 09032013 16032013 23032013 30032013]
    @themes = %w[Globalism Love War Animals Art Cybernetics Technology Biology Education]
    @sessions = dates.each_with_index.map { |date, i| Session.new(i, date) }  
    @participants = names.map { |name| Participant.new(name, "YELLOW") }
  end
 
  def change_preference(options)
    participant = @participants.select { |p| p.name == options[:name] }
    participant[0].preference = options[:number]
   end

   def populate_sessions_with_themes
     @sessions.each do |session|
       2.times { session.themes << @themes.dup.shuffle!.pop }
       puts "Session #{ session.number } has as themes: #{ session.themes.join(" and ")}"
     end	     
   end
end
 
class Participant
  attr_accessor :preference
  attr_reader :name
  attr_reader :favorite_color

  def initialize(name, preference = nil, favorite_color)
    @name = name
    @preference = preference
    @favorite_color = change_color(favorite_color)
  end
  
  def change_color(favorite_color)
    return "black"
    puts "tralalallalalalalalalalla"
  end
end

course = Course.new("Arts, Science, and Technology")
course.change_preference({name: "Dan", number: 3})
binding.pry
