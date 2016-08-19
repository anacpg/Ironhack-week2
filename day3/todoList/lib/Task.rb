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