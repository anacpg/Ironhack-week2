class Post

	attr_reader :title, :date, :text, :sponsored

	def initialize (title , text, author, category, sponsored = false)
		@title = title
		@date = Time.now
		@text = text
		@autor = author
		@category = category
		@sponsored = sponsored

	end

end