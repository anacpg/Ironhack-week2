
class Search_movies
	attr_reader :movies, :years

	def initialize 
		@movies = []
	end

	def search_movies title
		all_movies = movies_imdb title
		movies_with_poster = search_movies_with_poster all_movies
		create_movies movies_with_poster
	end

	def movies_imdb movie_title
		i = Imdb::Search.new(movie_title)
		a = i.movies
	end

	def search_movies_with_poster array_movies
		movies = []
		array_movies.each do |movie|
			if movies.length == 9 
				return movies
			else movie.poster != nil 
				movies << movie
			end
		end
	end

	def create_movies array_movies
		@movies = []
		@years = []
		array_movies.each do |movie| 
			@years << movie.year.to_i
			m = Movie.new movie.title, movie.year, movie.poster
			@movies << m
		end
	end

	def random_year
		prng = Random.new
		len = @years.length
		random = prng.rand(0...len)
		
		@years[random]

	end
end