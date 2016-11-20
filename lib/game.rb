class Game
	def initialize()
		@player1 = Player.new
		@player2 = Player.new
		@turno = "j1"		
	end

	def getBoard1()
		return @player1.getBoard()
	end

	def getBoard2()
		return @player2.getBoard()
	end

	def ponerBarco(fila, columna)
		if(@turno == "j1")
			@player1.ponerBarco(fila,columna)
		else
			@player2.ponerBarco(fila,columna)			
		end
	end

	def camnbiarTurno()
		if(@turno == "j1")
			@turno ="j2"
		else
			@turno = "j1"
		end
	end


	
end