# server.rb
require "sinatra"
require "./lib/calculator"

get "/add" do
  erb :add
end

post "/calculate" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  operation = params[:operation]

  case operation  
  when "add"
  	@@result = Calculator.add first, second
  when "res"
  	@@result = Calculator.substract first, second
  when "mult"
  	@@result = Calculator.multiply first, second
  when "div"
  	@@result = Calculator.divide first, second
  end

  redirect to("/result")
end

get '/result' do 
	#@resultado = @@result
	erb :result
end

# post "/calculate_substract" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   result = Calculator.substract first, second
#   "#{first} + #{second} = #{result}"
# end

# post "/calculate_multiply" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   result = Calculator.multiply first, second
#   "#{first} + #{second} = #{result}"
# end

# post "/calculate_divide" do
#   first = params[:first_number].to_f
#   second = params[:second_number].to_f
#   result = Calculator.divide first, second
#   "#{first} + #{second} = #{result}"
# end
