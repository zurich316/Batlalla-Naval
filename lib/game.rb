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


	
end