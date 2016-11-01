require 'sinatra'
require_relative "lib/table.rb"

  game =  Table.new(10)
  set :game, game

  get '/' do
    	erb :main
  end

  get '/table' do
    @tb = game.getMatriz()
    erb :table
  end


  post '/table' do
    @row = params[:row]
    @colum = params[:colum].to_i
    @dir = params[:dir]
    @verificar = game.posicionarBarco(2,@dir,@row,@colum)
    @tb = game.getMatriz()
    erb :table
  end

