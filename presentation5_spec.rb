require './presentations5'  # <-- your sinatra app
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'Presentations App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should include 'Presentation Schedule'
  end
end
