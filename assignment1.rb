class Session
	attr_accessor :number
	attr_accessor :name
	
	def initialize(number, name)
		@number = number
		@name = name
	end
end

$names = %w[Dan Ted Phil Steve Hank]
$sessions = []
$populate_sessions = 3.times do |a| 
	a_name = $names.shuffle!.pop
  $sessions << Session.new(a+3, [a_name])
end

$names.dup.each do |name|
	$sessions.shuffle!
	while $sessions[0].name.length > 1 do
		$sessions.shuffle!
  end
 	$sessions[0].name << name
	$names.delete(name)
end






# Sample's Questions:
#
# 1. What are the variables and how they appear to relate to each other?
# 2. What processes does the code seem to regulate?
# 3. What does the code seem to make possible and what does it ignore?
# 4. What non-procedural knowledge can we glean?
#
#
# Homework:
#
# Improve on this code
#
# Add more classes
# Add functionality
# Improve functionality
#
# Post it in a gist on Github
#
# Email me the link to your gist (DEADLINE: Monday morning at Sunrise)
