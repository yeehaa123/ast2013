# require 'pry'

class Session
  attr_accessor :number, :name, :date
 
  def initialize(number, name)
  	@number = number
  	@name 	= name
        @date = session_date(number)
   end
 
   def session_date(number)
    dates = %w[02032013 09032013 16032013 23032013 30032013]
    return dates[number + 3]
   end
end
 
class Course
 
  def initialize(course_name)
    @course_name = course_name
    names = %w[Dan Ted Phil Steve Hank]
    @sessions = []
    @participants = names.each { |name| Participant.new(name) }
  end
 
  def change_preference(options)
    participant = @participants.where(name: options[:name])
    participant[:number] - options[:number]
   end
end
 
Class Participant
  attr_accessor: preference
  
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
 
# Froukes Class
#
#	class Themes
#  
# 	attr_accessor :themes
# 	attr_accessor :themes_2
#  
# 	def initialize (themes, themes_2)
# 		@themes = themes
# 		@themes_2 = themes_2
#  
# 		# the following reports on self from inside a class method (themes)
#  
# 		def Themes.x
# 			puts "Class method of class themes"
# 			puts "self: #{self}"
#  
# 		$themes = %w[Globalism Love War Animals Art Cybernetics Technology Biology Education]
# 		$themes_2 = %w[Globalism Love War Animals Art Cybernetics Technology Biology Education]
# 		$sessions = []
# 		$populate_sessions = 4.times do |a|
# 		a_themes = $themes.shuffle!.pop
# 		a_themes_2 = $themes_2.shuffle!.pop
# 		$sessions << Session.new(a, a_themes)
# 		print "Session ", [a+1], ": ",  a_themes, " at ", a_themes_2
# 		puts "" 
# 	end
# end 

course = Course.new("Arts, Science, and Technology")
course.change_preference({name: "Daan", 7])
# binding.pry
