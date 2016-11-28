class	Player
   	def initialize()
	   @board = Array.new(10){Array.new(10){'A'}}
	   @ships = 5
  	end

  	def resetBoard()
		return @board = Array.new(10){Array.new(10){'A'}}
	end

  	def resetShips()
		@ships = 5
	end

	def setShips(cantbarcos)		
		@ships = cantbarcos
		
	end

	def areThereShips?()
		if(@ships != 0)
			return true
		else
			return false
		end
	end

	
	def getShips()
		return @ships
	end

	def getBoard()
		return @board
	end

	def returnRow(row)
		abc = [*'A'..'J']
		return abc.index(row)
	end

	def placeElementInTheBoard(row,column,element)
   	 	@board[row][column] = element
  	end

  	def returnElementFromBoard(row, column)
      	return @board[row][column]
 	end

	def placeShip(row,colum)
		if(checkPlaceShip(row,colum))
			row = returnRow(row)
			colum=colum-1
			placeElementInTheBoard(row,colum,'B')	
			@ships = @ships - 1
		end
	end

	def checkPlaceShip(row,colum)
		row = returnRow(row)
		colum=colum-1
		if (returnElementFromBoard(row,colum) == 'B')
		   return false
		else
		   return true
		end
	end

	def BoardEmpty?()
		if(@board == Array.new(10){Array.new(10){'A'}})
			return true
		else
			return false
		end
	end

	def isThereShipsInTheBoard?()
		@board.each do |chr|
			res = chr.index('B')
			if res != nil
				return true
			end
		end
		return false
	end

	def checkAttack(row, column)
		row = returnRow(row)
	  	column=column-1
		element = returnElementFromBoard(row,column)
		if(element == 'F' || element == 'X')
			return false
		else
			return true
		end
		
	end

 	def Attack!(row, column)
 		if(checkAttack(row,column))
 			row = returnRow(row)
		  	column=column-1
		    element = returnElementFromBoard(row,column)
		    if (element=='A')
		      placeElementInTheBoard(row,column,'F')
		    end

		    if (element == 'B')
		      placeElementInTheBoard(row,column,'X')
		    end

 		end		
 	end
=begin
	def Attack!2(row, column)
	  	row = returnRow(row)
	  	column=column-1
	    result = devolverResultadoDeAtaque(row,column)
	    placeElementInTheBoard(row,column,result)
  	end


	
def posicionarBarco1(tam,dir,row,colum)
		if(asegurarBarcoEnboard(tam,dir,row,colum) && checkPlaceShip(row,colum) )
			row = returnRow(row)-1
			colum=colum-1
			count = 0
			if(dir=="h")
				while count < tam
					@matriz[row][count+colum] = 'B'
					count+=1
				end
			else
				while count < tam
					@matriz[row+count][colum] = 'B'
					count+=1
				end
			end
			return true
		else
			return false
		end

	end

	def asegurarBarcoEnmatriz(tam,dir,row,colum)
		tam=tam-1
		row = devolverFila(row)-1
		colum=colum-1
		if(dir=='h')
			if(colum+tam>=@tam)
				return false
			else
				return true
			end
		else
			if(row+tam>=@tam)
				return false
			else
				return true
			end
		end
	end
=end






end
