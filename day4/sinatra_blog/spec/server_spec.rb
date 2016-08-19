require_relative '../server.rb'
require 'rspec'
require 'rack/test'

 session["user"] ||= nil

describe "Server Test" do 
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	let(:post1) { Post.new "Post1", "1 - textotextotextotextotexto" }
	let(:post2) { Post.new "Post2", "2 - textotextotextotextotexto" }
	let(:post3) { Post.new "Post3", "3 - textotextotextotextotexto" }
	
	before :each do 
		@blog = Blog.new "Sinatra blog"
		@blog.add_post post1
		@blog.add_post post2
		@blog.add_post post3
	end

	it "should returns an array of the posts added" do 
		expect(@blog.posts.length).to eq(3)
	end

	it "should return an array of the posts in the correct chronological order" do 
		expect(@blog.latest_posts).to eq([post3, post2, post1])
	end


	# it "should load the home page" do 
	# 	get '/'
	# 	expect(last_response).to be_ok ## estado 200 que es el ok
	# end

	# it "should load the home page" do 
	# 	get '/home'
	# 	expect(last_response).to_not be_ok
	# end

	# it "should load" do 
	# 	get 'real_page'
	# 	expect(last_response).to be_ok
	# end

	# it "should load" do 
	# 	get '/hi'
	# 	expect(last_response.redirect?).to be(true)
	# 	#binding.pry
	# 	follow_redirect!
	# 	#binding.pry
	# 	expect(last_request.path).to eq('/real_page')
	# end
end 