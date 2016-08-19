require_relative '../server.rb'
require 'rspec'
require 'rack/test'


describe "Server Test" do 
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	it "should load the home page" do 
		get '/'
		expect(last_response).to be_ok ## estado 200 que es el ok
	end

	it "should load the home page" do 
		get '/home'
		expect(last_response).to_not be_ok
	end

	it "should load" do 
		get 'real_page'
		expect(last_response).to be_ok
	end

	it "should load" do 
		get '/hi'
		expect(last_response.redirect?).to be(true)
		#binding.pry
		follow_redirect!
		#binding.pry
		expect(last_request.path).to eq('/real_page')
	end
end 