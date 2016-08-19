#Inside of server.rb
require 'sinatra'
require 'sinatra/reloader'

# We're going to need to require our class files
require_relative('lib/Task.rb')
require_relative('lib/TodoList.rb')
require 'pry'



get '/' do
	'Hello, World!' 
end

get '/real_page' do
	'The other page'
end

get '/hi' do
	redirect 'real_page'
end

# @@todo_list = TodoList.new("Josh")
# #@@todo_list.load_tasks
# task1 = Task.new "Buy bacon"
# task2 = Task.new "Buy cheese"
# @@todo_list.add_task task1
# @@todo_list.add_task task2


# get "/tasks" do
# 	@tasks = @@todo_list.tasks
# 	erb :task_index
# end


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

# get '/complete_task/:id' do
# 	taskid = params[:id].to_i
# 	@completed_task = @@todo_list.find_task_by_id(taskid)
# 	@completed_task.complete! #if task

# 	redirect to("/tasks")
# end












