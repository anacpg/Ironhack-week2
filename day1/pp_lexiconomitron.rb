class Lexiconomitron
	def eat_t sentence
		splitted_sentence = sentence.split('')
		new_sentence = ""
		splitted_sentence.each do |letter|
			if letter != "t" && letter != "T"
				new_sentence += letter
			end	
		end
		new_sentence
	end

	def shazam array_sentence

		reversed_sentence = array_sentence.map do |word|
			word = word.reverse
			eat_t word
		end
		[reversed_sentence.first, reversed_sentence.last]
	end

	def oompa_loompa array_word
		three_letter_less = []
		array_word.each do |word|
			if word.length <= 3
				word = eat_t(word)
				three_letter_less.push(word)
			end
		end
		three_letter_less
	end
end


RSpec.describe "Lexiconomitron" do 
	before :each do 
		@lexi = Lexiconomitron.new
	end
	describe "#eat_t" do
	    it "removes every letter t from the input" do
	      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
	    end
	end
  	describe "#shazam" do 
	  	it "reverse letters and return the first and last words" do
	  		expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
  		end
	end

	describe "#oompa_loompa" do
		it "takes the ones which size is three characters of less in the same order" do
	      	expect(@lexi.oompa_loompa(["if", "you", "wanna", "be", "myt", "lover"])).to eq(["if", "you", "be", "my"])
		end
	end
end