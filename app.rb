require 'sinatra'

get '/' do
	@a= ['a','b','c']
	@var2= [["b", 1, 2 ,3], ["a", 1, 2 ,3], ["a", 1, 2 ,3]]
	erb :hola
end
