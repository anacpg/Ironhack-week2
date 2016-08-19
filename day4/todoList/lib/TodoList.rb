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

    def load_tasks 
        
    end

end