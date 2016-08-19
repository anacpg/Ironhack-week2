#server.rb
require 'sinatra'
require 'sinatra/reloader'

# We're going to need to require our class files
require_relative('lib/Post.rb')
require_relative('lib/Blog.rb')
require 'pry'

enable (:sessions)

lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pretium purus et iaculis sodales. 
Vivamus dignissim malesuada velit, a vestibulum tortor mattis ut. Class aptent taciti sociosqu ad litora
 torquent per conubia nostra, per inceptos himenaeos. Fusce vehicula dictum lobortis. Maecenas vulputate,
  lacus vel sagittis mollis,  felis nibh tincidunt ipsum, a facilisis nulla arcu eu lacus. Morbi at vulputate 
  leo, id consequat metus. Vivamus placerat turpis eget ex venenatis, at interdum erat ultricies. Mauris gravida 
  lorem sit amet nibh laoreet, vel cursus diam feugiat. Sed at bibendum dui. Vestibulum dignissim massa ex, 
  feugiat tincidunt erat sodales id. Donec et metus ligula. Phasellus quis nunc lacus. Proin pretium dignissim 
  pharetra. Sed eu molestie turpis, eu bibendum augue. Integer luctus est eu enim malesuada euismod.
Duis luctus feugiat pharetra. Nam tincidunt leo ac urna pretium sodales. Vivamus pulvinar sem eu dui tincidunt, 
mattis efficitur augue euismod. Phasellus at enim sit amet odio luctus consectetur vitae malesuada libero. "

blog = Blog.new("Sinatra Blog1")
blog.add_post Post.new "Post1", lorem_ipsum
blog.add_post Post.new "Post2", lorem_ipsum
blog.add_post Post.new "Post3", lorem_ipsum
blog.add_post Post.new "Post4", lorem_ipsum

get '/' do

	@@posts = blog.latest_posts
	#session["posts"] ||= @posts2
	#@blog1 = @blog
	
	#@@posts = blog.posts

	erb :principal_page
end

get '/posts/:index' do 
	@post = @@posts[params[:index].to_i] 
	erb :show_post
end

get '/new_post' do
  # Show the form
  erb :new_post
end

post '/create_post' do
  # Receive the form submission
  title = params[:new_title]
  text = params[:new_text]
  new_post = Post.new title, text 
  blog.add_post new_post
  redirect to('/')
end


# get "/new_task" do 
# 	erb :new_task
# end

# post "/create_task" do
# 	content_new_task = params[:new_task]
# 	new_task = Task.new content_new_task
# 	@@todo_list.add_task new_task
# 	#@tasks = @@todo_list.tasks
# 	#erb :task_index
# 	redirect to("/tasks")
# end 