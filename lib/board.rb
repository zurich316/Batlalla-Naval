class	Board
   	def initialize()
	   @matriz = Array.new(10){Array.new(10){'A'}}
  	end

	def getMatriz()
		return @matriz
	end

	def cleanMatriz()
		return @matriz = Array.new(10){Array.new(10){'A'}}
	end

	def devolverFila(fila)
		abc = [*'A'..'J']
		return abc.index(fila)
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
		if (@matriz[row][colum] == 'B')
		   return false
		else
		   return true
		end
	end

	def hayBarcosSinUndir()
		@matriz.each do |chr|
			res = chr.index('B')
			if res != nil
				return true
			end
		end
		return false
	end

  def devolverElementoDeLaMatriz(fila, columna)
      return @matriz[fila][columna]
  end

  def devolverResultadoDeAtaque(fila, columna)
    elemento = devolverElementoDeLaMatriz(fila,columna)
    if (elemento=='A')
      return 'F'
    end
    if (elemento == 'B')
      return 'X'
    end
    return elemento
  end

  def posicionarElementoEnMatriz(fila,columna,elemento)
    @matriz[fila][columna] = elemento
  end

  def hacerAtaque(fila, columna)
  	fila = devolverFila(fila)
  	columna=columna-1
    result = devolverResultadoDeAtaque(fila,columna)
    posicionarElementoEnMatriz(fila,columna,result)
  end

=begin
	
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
