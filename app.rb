require 'sinatra'

get '/' do
	@a="Cadena"
	@var2= [["b", "b", "b" ,"b"], ["b", "b", "b" ,"b"], ["b", "b", "b" ,"b"]]
	@tab=Array.new(4){Array.new(4){'O'}}
	@tab_array=@tab.join(',')
	erb :main
end

post '/table' do
  @valor1 = params[:row]
  @valor2 = params[:colum]
  @valor3 = params[:tb]
  #@valor3[@valor1][@valor2]="X"

  erb :table
end