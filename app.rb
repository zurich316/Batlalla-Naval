require 'sinatra'
require_relative "lib/table.rb"

get '/' do
	@matriz = Table.new
	@matriz = @matriz.generarMatriz(10)
	erb :main
end

post '/table' do
  @valor1 = params[:row]
  @valor2 = params[:colum]
  @valor3 = params[:tb]
  #@valor3[@valor1][@valor2]="X"

  erb :table
end