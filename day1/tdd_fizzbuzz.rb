
class Fizzbuzz

	def get_fizzbuzz_number number
		div_three = divisible_by_three number 
		div_five = divisible_by_five number 

		string_to_return = div_three + div_five 
		string_to_return == "" ? number.to_s : string_to_return
	end

	def divisible_by_three number		
		number % 3 == 0 ? "Fizz" : ""
	end

	def divisible_by_five number
		number % 5 == 0 ? "Buzz" : ""
	end
end


RSpec.describe "" do 

	let(:fizzbuzz) {Fizzbuzz.new}

	it "- Receive a number that is divisible by 3 " do
		expect(fizzbuzz.get_fizzbuzz_number(9)).to eq("Fizz")
	end

	it "- Receive a number that is divisible by 5 " do
		expect(fizzbuzz.get_fizzbuzz_number(10)).to eq("Buzz")
	end

	it "- Receive a number that is divisible by 5 and 3 " do
		expect(fizzbuzz.get_fizzbuzz_number(15)).to eq("FizzBuzz")
	end

	it "- Receive a number that is not divisible by 5 and 3 " do
		expect(fizzbuzz.get_fizzbuzz_number(11)).to eq("11")
	end
end
