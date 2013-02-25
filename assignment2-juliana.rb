require 'pry'

class Session
				puts "This is the list of: "
				p self

				attr_accessor :number, :name, :date

				def initialize(number, name)
								@number = number
								@name 	= name
								@date = session_date(number)
				end

				def session_date(number)
								dates = ["March 5", "March 12", "March 19", "March 26", "April 5"]
								return dates[number]
				end
end

session = Session.new(12, "Course")
p session.session_date(1)

class Participant
				attr_accessor :preference
				attr_reader :name

				def initialize(name, preference = nil, favorite_color)
								@name = name
								@preference = preference
								@favorite_color = change_color(favorite_color)
				end

				def change_color(color)
								"You're favourite color is #{color}"
				end
end



class Course 

				def initialize(course_name)
								@course_name = course_name
								names = %w[Dan Ted Phil Steve Hank]
								@sessions = []
								@participants = names.map { |name| ::Participant.new(name, "Yellow") }
				end

				def list_participants
					puts "The participants are:"
					@participants.each do |p|
						puts p.name
					end
				end

				def change_preference(options) 
								participant = @participants.select { |p| p.name == options[:name] }
								participant[0].preference = options[:number]

				end
end

course = Course.new("Arts, Science, and Technology")
course.change_preference({name: "Dan", number: 7})
course.list_participants

class Participant
				attr_accessor :preference

				def initialize(name, preference = nil, favorite_color)
								@name = name
								@preference = preference
								@favorite_color = change_color(favorite_color)
				end

				def change_color(favorite_color)
								color = gets.chomp
								puts "You're favourite color is #{color}"
				end
end

# Participants' Data ~ Example
# Dan's data
dan_data = {
				"full name" => "Dan Craig",
				"e-mail" => "dan.craig@uva.nl",
				"id" => "101045"
}

participantsdata = [ dan_data ]

class Data < ::Participant 
				attr_accessor :fullname, :email, :id

				def initialize(options)
								@full_name = options[:fullname]
								@e_mail = options[:email]
								@id = options[:id] 
				end
end

def participantsdata(data)
				puts full + "	" + email + "	" + id
end

data = Profile.new(dan_data)
