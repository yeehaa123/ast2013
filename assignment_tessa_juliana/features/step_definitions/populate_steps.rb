class Course
	attr_accessor :participant, :session

	def initialize 
		@participant = participant
		@session = session
	end
end

class Participant
	def populate(session_participant)
		names = %w["Anne-Claire", "Bram", "Daan", "Frouke", "Juliana", "Sonia", "Tessa", "Phil", "Ted"]
		session = %w[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


		@session_names = session_names
		populate_sessions = 3.times do |a|
			a_participant = participants.shuffle!.pop 
			a_session = sessions.shuffle!.pop(a+3, [ a_names] [ a_session])
		end
	end
end

Given(/^a course$/) do
	@course = Course.new
end

Given(/^(\d+) participants in the course$/) do |number|
	@course.participants = number.to_i.times.map { |i| Participant.new(name: "Participant #{i}")}
end

Given(/^(\d+) course sessions$/) do |number|
	@course.sessions = number.to_i.times.map { |i| Session.new(name: "Session #{i}")}
end

When(/^I populate the sessions$/) do
	@course.populate_sessions
end

Then(/^each session should have (exactly|at least|at most) (\d+) presenters?$/) do |sthing, number|
	@course.sessions.each do |session|
		if sthing == "exactly"
			expect(session.presenters.length).to eq number.to_i
		elsif sthing == "at least"
			expect(session.presenters.length).to be >= number.to_i
		elsif sthing == "at most"
			expect(session.presenters.length).to be <= number.to_i
		end
	end
end

Then(/^there should be (\d+) session with (\d+) presenters$/) do |num_ses, num_pres|
	s = []
	@course.sessions.each do |session| 
		s << session if session.presenters.length == num_pres.to_i
	end
	expect(s.length).to eq num_ses.to_i
end
