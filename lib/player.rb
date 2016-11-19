class Player
	def initialize()
		@barcos = 5
		@tb = Board.new()		
	end

	def limpiarTablero()
		@tb.cleanMatriz()
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
		return @tb.getMatriz()
	end


	def ponerBarco(row,colum)
		verificar = @tb.posicionarBarco(row,colum)
		if(verificar)
			@barcos=@barcos-1
			return true
    	else 
    		return false
    	end

	end

	def endGame()
		if(@tb.hayBarcosSinUndir())
			return false
		else
			return true
		end
	end

	def hacerAtaque(fila, columna)
		@tb.hacerAtaque(fila,columna)
	end

end