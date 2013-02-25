class Session
	attr_accessor :number
	attr_accessor :name
	
	def initialize(number, name)
		@number = number
		@name = name
	end
end

$names = %w[Dan Ted Phil Steve Hank Rick Don Sam]
$sessions = []
$number_of_presenters = $names.length / 3
puts $number_of_presentaters
$populate_sessions = 3.times do |a| 
	a_name = $names.shuffle!.pop
  $sessions << Session.new(a+3, [a_name])
end

$names.dup.each do |name|
	$sessions.shuffle!
	while $sessions[0].name.length > $number_of_presenters do
		$sessions.shuffle!
  end
 	$sessions[0].name << name
	$names.delete(name)
end
