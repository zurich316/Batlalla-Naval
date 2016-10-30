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
    @row = params[:row].to_i
    @colum = params[:colum].to_i
    @dir = params[:dir]
    game.posicionarBarco(2,@dir,@row-1,@colum-1)
    @tb = game.getMatriz()
    @@F = 0
    erb :table
  end

