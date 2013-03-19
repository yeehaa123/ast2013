Feature: assign the presenters to a sessions
	
	In order to assign the prestenters to a session
	As an instructor of the course 'Arts, Science, and Technology'
	I want to have an algorithm to do this for me

	Scenario: with just as many participants as sessions
		Given a course
		And 3 participants in the course
		And 3 course sessions
		When I populate the sessions
		Then each session should have exactly 1 presenter
	
	Scenario: with more participants than sessions
		Given a course
		And 10 participants in the course
		And 3 course sessions
		When I populate the sessions
		Then each session should have at least 3 presenter
		And each session should have at most 4 presenters
		And there should be 1 session with 4 presenters

	Scenario: with less participants than sessions
		Given a course
		And 3 participants in the course
		And 6 course sessions
		When I populate the sessions
		Then each session should have at most 1 presenters
		And there should be 3 session with 0 presenters	

