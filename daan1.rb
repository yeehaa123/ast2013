class Session
  attr_accessor	:number, :name, :absence
	def initialize(number, name, abscence)
		@number, @name, @absence = number, name, abscence
	end	
end

$names = %w[Oznur Merel Menno Daan Sander Frouke Tessa Bram Anne-Claire]
$sessions = [10]
$populate_sessions = 3.times do |a|
		a_name = $names.shuffle!.pop
	$sessions << Session.new(a+3, [a_name])
end

$names.duo.each do |name|
		$sessions.shuffle!
		while $sessions[0].name.length > 1 do
				$sessions.shuffle!
	end
		$sessions[0].name << name
		$names.delete(name)
end
