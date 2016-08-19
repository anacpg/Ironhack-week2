#server.rb
require 'sinatra'
require 'sinatra/reloader'
require 'imdb'

# We're going to need to require our class files
require_relative('lib/Movie.rb')
require_relative('lib/Search_movies.rb')
require 'pry'

search_movies = nil

get '/' do 
	search_movies = Search_movies.new
	erb :principal_page
end

post '/search_movies' do
	search_movies.search_movies params[:movie_title]
	redirect to('/movies')
	#erb :movies
end

get '/movies' do 
	@movies = search_movies.movies
	prng = Random.new
	len = @movies.length
	random = prng.rand(0...len)

	@year = @movies[random].year
	erb :movies
end


# get '/' do

# 	@@posts = blog.latest_posts
# 	#session["posts"] ||= @posts2
# 	#@blog1 = @blog
	
# 	#@@posts = blog.posts

# 	erb :principal_page
# end

# get '/posts/:index' do 
# 	@post = @@posts[params[:index].to_i] 
# 	erb :show_post
# end

# get '/new_post' do
#   # Show the form
#   erb :new_post
# end

# post '/create_post' do
#   # Receive the form submission
#   title = params[:new_title]
#   text = params[:new_text]
#   new_post = Post.new title, text 
#   blog.add_post new_post
#   redirect to('/')
# end