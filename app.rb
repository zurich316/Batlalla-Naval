require 'sinatra'
require_relative "lib/table.rb"

  game =  Table.new(10)
  set :game, game

  table2 =  Table.new(10)
  set :table2, table2



  get '/' do
    	erb :main
  end

  get '/table' do
    @tb = game.getMatriz()
    erb :table
  end

  get '/jugar' do
    @tb2 = table2.getMatriz()
    erb :jugar
  end


  post '/table' do
    @row = params[:row]
    @colum = params[:colum].to_i
    @dir = params[:dir]
    @verificar = game.posicionarBarco(1,@dir,@row,@colum)
    @tb = game.getMatriz()
    erb :table
  end

  post '/attack' do
    @row = params[:row]
    @colum = params[:colum].to_i
    @tb2.hacerAtaque(@row, @colum, game)
    erb :jugar
  end
