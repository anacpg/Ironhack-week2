require 'pry'
require_relative './sinatra_todo_p1.rb'


RSpec.describe "TodoList" do 

	let(:task1) { Task.new("Buy the milk") }
	let(:todoList) { TodoList.new "Alex"}


    it "return true if task is completed, else it return false" do
      expect(task1.complete?).to be false
    end

    it "first, task have been completed and it return false" do
   	  task1.complete!
      expect(task1.complete?).to be true
    end

    it "first, task have been completed and then it return false" do
   	  task1.make_incomplete!
      expect(task1.complete?).to be false
    end

    it "update the task1 and return the new content" do
   	  task1.update_content!("Buy the water")
      expect(task1.content).to eq("Buy the water")
    end

	it "return the object task" do 
		todoList.add_task(task1)
		expect(todoList.tasks[0]).to eq (task1)
	end

	it "delete task and return other task" do
		tasks = todoList.tasks
		todoList.delete_task(1)
		expect(todoList.tasks.include? task1).to be false

	end 

	it "find a specific task" do
		
		todoList.add_task(Task.new "Buy the cheese")
		todoList.add_task(Task.new "Buy the champoo")
		expect(todoList.find_task_by_id(8).content).to eq("Buy the champoo")

	end

	it "not find a specific task and return nil" do
		
		todoList.add_task(Task.new "Buy the cheese")
		todoList.add_task(Task.new "Buy the champoo")
		expect(todoList.find_task_by_id(3)).to eq(nil)

	end

	it "sort @tasks by it's date, and return a new array of sorted tasks." do
		
		t1 = Task.new "Buy the cheese"
		t2 = Task.new "Buy the champoo"
		t3 = Task.new "Buy the bacon"

		todoList.add_task(t3)
		todoList.add_task(t2)
		todoList.add_task(t1)

		expect(todoList.sort_by_created).to eq([t1, t2, t3])

	end

end
