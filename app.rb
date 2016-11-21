require 'sinatra'
require_relative "lib/board.rb"
require_relative "lib/game.rb"
require_relative "lib/player.rb"


  game =  Game.new()
  set :game, game

  get '/' do
   # game.limpiarTablero()
    #game.regresarBarcos()
    erb :main
  end
 
  get '/table' do      
    erb :table
  end
  
  post '/table' do
    @row = params[:row]
    @colum = params[:colum].to_i
    game.ponerBarco(@row,@colum) 
    if(game.hayBarcosEnjugador1() == false && game.retornarTurno() == "j1")
      game.camnbiarTurno()
    end  

    if(game.hayBarcosEnjugador2() == false)
      erb :attack
    else
      erb :table
    end    
    
  end

  get '/attack' do
    erb :attack
  end
=begin
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
=end
