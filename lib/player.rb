class Player
	def initialize()
		@barcos = 5
		@tb = Board.new()		
	end

	def limpiarTablero()
		@tb.cleanBoard()
	end

	def regresarBarcos()
		@barcos = 5
	end

	def hayBarcos()
		if(@barcos != 0)
			return true
		else
			return false
		end
	end

	
	def getBarcos()
		return @barcos
	end

	def getBoard()
		return @tb.retornarTablero()
	end

	def verificarPosicionBarco(fila, columna)
		return @tb.posicionarBarco(fila,columna)
	end


	def ponerBarco(fila,columna)
		if(verificarPosicionBarco(fila, columna))
			@barcos=@barcos-1
		end

	end

	def endGame()
		if(@tb.hayBarcosEnElTablero?())
			return false
		else
			return true
		end
	end

	def hacerAtaque(fila, columna)
		@tb.hacerAtaque(fila,columna)
	end

end