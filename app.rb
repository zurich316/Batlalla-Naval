require 'sinatra'
require_relative "lib/game.rb"
require_relative "lib/player.rb"


  game =  Game.new()
  set :game, game

  get '/' do
    game.resetPlayer1()
    game.resetPlayer2()
    game.resetTurn()
    erb :main
  end

  get '/wait' do
    erb :wait
  end
 
  get '/table' do      
    erb :table
  end
  
  post '/table' do
    @row = params[:row]
    @colum = params[:colum].to_i
    @warning = game.checkPlaceShip(@row,@colum)
    game.placeShip(@row,@colum) 
    if(game.areTherShipsInPlayer1?() == false && game.turnPlayer1?)
      game.changeTurn()
      erb :wait
    else
      if(game.areTherShipsInPlayer2?() == false && game.turnPlayer1? == false)
        game.changeTurn()
        erb :waitAttack
      else
        erb :table
      end   
    end  
    
  end

  get '/setshipsquantity' do
    erb :setshipsquantity
  end

  post '/setshipsquantity' do
    @shipsquantity = params[:shipsquantity]
    game.setShipsQuantity(@shipsquantity)
    erb :wait
  end

  get '/attack' do
    erb :attack
  end

  get '/waitAttack' do
    erb :waitAttack
  end

  get '/attack' do
    erb :attack
  end

  post '/attack' do
    @row = params[:row]
    @colum = params[:colum].to_i
    @warningAttack = game.checkAttack(@row,@colum)
    if(@warningAttack)
      game.AttackOpponent(@row,@colum)
      game.changeTurn()
    end

    if(game.whoWins?() == "nobody")
      erb :waitAttack
    else
       erb :end
    end

   
  end

