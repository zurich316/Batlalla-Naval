require 'sinatra'
require_relative "lib/board.rb"
require_relative "lib/game.rb"

  game =  Game.new()
  set :game, game

  get '/' do
    game.limpiarTablero()
    game.regresarBarcos()
    erb :main
  end
 
  get '/table' do      
    erb :table
  end
 
  post '/table' do
    @row = params[:row]
    @colum = params[:colum].to_i
    game.ponerBarco(@row,@colum)
    if(game.hayBarcos())
       erb :table
    else
       erb :attack
    end
  end

  get '/attack' do
    erb :attack
  end

  post '/attack' do
    @row = params[:row]
    @colum = params[:colum].to_i
    game.hacerAtaque(@row,@colum)
    if game.endGame()
      erb :end
    else
      erb :attack
    end
  end

