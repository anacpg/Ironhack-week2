require_relative '../server.rb'
require 'rspec'
require 'rack/test'



describe "Server Test" do 
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	let(:search_movies) { Search_movies.new }
	
	before :each do 
	end

	it "Return Search_movies" do 
		movies = movies_imdb "Titanic"
		expect(movies.).to eq(3)
	end
end