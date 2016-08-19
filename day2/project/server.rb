#server.rb

require 'sinatra'

get "/hola" do 
	"my sinatra app"
end

get "/about" do 
	#conecta con bd ...
	@usuarios = ['Pepe', 'Luis', 'Manuel']
	@quetal = "Que tal?"
	@mostrar = false
	erb :about
end

get "/time" do 
	@time = Time.now
	erb :time
end

get "/my_twitter/:usuario" do
	@usuario = params[:usuario]
	erb :usuarios
end

