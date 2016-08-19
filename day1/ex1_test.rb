
class StringCalculator


	def add(input)

		#solucion 1
		# if input == ""
		# 	0
		# else
		# 	numbers = input.split(" ")
		# 	if numbers.length == 1
		# 		input.to_i
		# 	else
		# 		sum = numbers.reduce(0){ |sum, x| sum + x.to_i}
		# 	end
		# 	#@add += input
		# 	#@add = @add + input.to_i 
		# end

		#solucion 2
		# numbers = input.gsub(/\D/," " )

		# numbers = numbers.split(" ")
		# numbers.reduce(0){ |sum,x| sum + x.to_i }

		##solucion 3
		input.split(',').map(&:to_i).reduce(0,:+)
		


	end

end


RSpec.describe "String Calculator test" do 
	it "zero digits" do 
		number = ""
		expect(StringCalculator.new.add(number)).to eq(0)
	end

	it "- returns number if I receive string with one number " do
		number = "9"
		expect(StringCalculator.new.add(number)).to eq(9)
	end

	it "- returns number if I receive string with two number " do 
		expect(StringCalculator.new.add("1,2")).to eq(3)
	end

	it "- returns number if I receive string with three number " do 
		expect(StringCalculator.new.add("1,2,3")).to eq(6)
	end
	
end

