class Game
	def initialize()
		@player1 = Player.new
		@player2 = Player.new		
	end

	def getBoard1()
		return @player1.getBoard()
	end

	def getBoard2()
		return @player2.getBoard()
	end

	
end