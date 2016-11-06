class Game
	def newGame()
		barcos = 5
		tb = Board.new()
		tb.cleanMatriz()
	end

	def getBoard()
		return tb
	end 

	def getBarcos()
		return barcos
	end

	def getBoard()
		return tb.getMatriz()
	end

	def ponerBarco(row,colum)
		verificar = game.posicionarBarco(row,colum)
		if(verificar)
			barcos=barcos-1
    	end
	end

	def play()


	end

	def endGame()
		if(tb.hayBarcosSinUndir())
			return true
		else
			return false
		end
	end

	def atacar(fila, columna)
		tb.hacerAtaque(fila,columna)
	end

end