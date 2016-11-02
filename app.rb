require 'sinatra'
require_relative "lib/table.rb"

  game =  Table.new(10)
  set :game, game

  barcos = 5
  set :barcos, barcos
  #table2 =  Table.new(10)
  #set :table2, table2



  get '/' do
    barcos = 5
    game.cleanMatriz()
    erb :main
  end

  get '/table' do
    @tb = game.getMatriz()
    erb :table
  end

 # get '/jugar' do
  #  @tb2 = table2.getMatriz()
   # erb :jugar
  #end


  post '/table' do
    @row = params[:row]
    @colum = params[:colum].to_i
    @dir = params[:dir]
    @verificar = game.posicionarBarco(1,@dir,@row,@colum)
    @bar = barcos
    if(@verificar)
      barcos=barcos-1
    end
    @tb = game.getMatriz()
    if(barcos>0)
       erb :table
    else
       erb :attack
    end
   
  end

  get '/attack' do
    @tb = game.getMatriz()
    erb :attack
  end

  post '/attack' do
    @row = params[:row]
    @colum = params[:colum].to_i
    game.hacerAtaque(@row,@colum)
    @tb = game.getMatriz()
    if game.hayBarcosSinUndir()
      erb :attack
    else
      erb :end
    end
    
  end
