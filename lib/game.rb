class Game
	def initialize()
		@player1 = Player.new
		@player2 = Player.new
		@turn = "j1"		
	end

	def getBoard1()
		return @player1.getBoard()
	end

	def getBoard2()
		return @player2.getBoard()
	end

	def getShipPlayer1()
		return @player1.getShips()
	end

	def getShipPlayer2()
		return @player2.getShips()
	end

	def areTherShipsInPlayer1?()
		return @player1.areThereShips?()
	end

	def areTherShipsInPlayer2?()
		return @player2.areThereShips?()
	end


	def returnTurn()
		return @turn
	end


	def placeShip(row, column)
		if(@turn == "j1")
			@player1.placeShip(row,column)
		else
			@player2.placeShip(row,column)			
		end
	end

	def changeTurn()
		if(@turn == "j1")
			@turn ="j2"
		else
			@turn = "j1"
		end
	end

	def resetTurn()
		@turn ="j1"	
	end

	def turnPlayer1?()
		if(@turn == "j1")
			return true
		else
			return false
		end
	end

	def resetPlayer1()
		@player1.resetBoard()
		@player1.resetShips()
	end

	def resetPlayer2()
		@player2.resetBoard()
		@player2.resetShips()
	end
	
	def checkPlaceShip(row,column)
		if(@turn == "j1")
			return @player1.checkPlaceShip(row,column)
		else
			return @player2.checkPlaceShip(row,column)			
		end
	end

	def AttackOpponent(row,column)
		if(@turn == "j2")
			@player1.Attack!(row,column)
		else
			@player2.Attack!(row,column)			
		end
	end

	def checkAttack(row,column)
		if(@turn == "j2")
			return @player1.checkAttack(row,column)
		else
			return @player2.checkAttack(row,column)			
		end
	end	

	

	def whoWins?()
		if(@player1.isThereShipsInTheBoard?() && @player2.isThereShipsInTheBoard?()==false )
			return "Jugador 1 gana!"
		else
			if(@player1.isThereShipsInTheBoard?()==false && @player2.isThereShipsInTheBoard?() )
				return "Jugador 2 gana!"
			else
				return "nobody"
			end
		end
	end
=begin
	def someoneLose?()
		if(@player1.isThereShipsInTheBoard?() || @player2.isThereShipsInTheBoard?() )
			return false
		else
			return true
		end
	end
=end
end