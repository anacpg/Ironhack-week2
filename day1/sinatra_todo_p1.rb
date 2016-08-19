class Task
    attr_reader :content, :id, :created_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @completed = false
        @created_at = Time.now
        @update_at = nil
        @@current_id += 1
    end

    def complete? 
    	@completed
    end

    def complete!
    	@completed = true
    end

    def make_incomplete!
    	@completed = false
    end

    def update_content! new_content
    	@content = new_content
    	@update_at = Time.now
    end
end

class TodoList
    attr_reader :tasks, :user
    def initialize user
        @user = user
        @tasks = []
    end

    def add_task task
    	@tasks << task
    end

    def delete_task task_id

    	@tasks.delete_if do |task|
    		task.id = task_id
    	end

    end

    def find_task_by_id task_id

    	aux_task =	@tasks.find do |task|
    		task.id == task_id
    	end

    end

    def sort_by_created

        sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
    end

end

 
# task1 = Task.new("Buy the milk") 
# todoList = TodoList.new 

# todoList.addTask(task1)




