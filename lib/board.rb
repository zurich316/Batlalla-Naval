class	Board
   	def initialize()
	   @matriz = Array.new(10){Array.new(10){'A'}}
  	end

	def retornarTablero()
		return @matriz
	end

	def cleanBoard()
		return @matriz = Array.new(10){Array.new(10){'A'}}
	end

	def devolverFila(fila)
		abc = [*'A'..'J']
		return abc.index(fila)
	end

	def posicionarElementoEnMatriz(fila,columna,elemento)
   	 	@matriz[fila][columna] = elemento
  	end

  	def devolverElementoDeLaMatriz(fila, columna)
      	return @matriz[fila][columna]
 	end

	def posicionarBarco(row,colum)
		if(verificarsisepuedeponerbarcos(row,colum))
			row = devolverFila(row)
			colum=colum-1
			posicionarElementoEnMatriz(row,colum,'B')
			return true
		else
			return false
		end

	end

	def verificarsisepuedeponerbarcos (row,colum)
		row = devolverFila(row)
		colum=colum-1
		if (devolverElementoDeLaMatriz(row,colum) == 'B')
		   return false
		else
		   return true
		end
	end

	def verificarTableroVacio()
		if(@matriz == Array.new(10){Array.new(10){'A'}})
			return true
		else
			return false
		end
	end

	def hayBarcosEnElTablero?()
		@matriz.each do |chr|
			res = chr.index('B')
			if res != nil
				return true
			end
		end
		return false
	end

	def verificarAtaque(fila, columna)
		fila = devolverFila(fila)
	  	columna=columna-1
		elemento = devolverElementoDeLaMatriz(fila,columna)
		if(elemento == 'F' || elemento == 'X')
			return false
		else
			return true
		end
		
	end

 	def hacerAtaque(fila, columna)
 		if(verificarAtaque(fila,columna))
 			fila = devolverFila(fila)
		  	columna=columna-1
		    elemento = devolverElementoDeLaMatriz(fila,columna)
		    if (elemento=='A')
		      posicionarElementoEnMatriz(fila,columna,'F')
		    end

		    if (elemento == 'B')
		      posicionarElementoEnMatriz(fila,columna,'X')
		    end
 		end		
 	end
=begin
	def hacerAtaque2(fila, columna)
	  	fila = devolverFila(fila)
	  	columna=columna-1
	    result = devolverResultadoDeAtaque(fila,columna)
	    posicionarElementoEnMatriz(fila,columna,result)
  	end


	
def posicionarBarco1(tam,dir,row,colum)
		if(asegurarBarcoEnmatriz(tam,dir,row,colum) && verificarsisepuedeponerbarcos(row,colum) )
			row = devolverFila(row)-1
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
