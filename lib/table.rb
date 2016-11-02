class	Table
   	def initialize(tam)
	   @tam = tam
	   @matriz = Array.new(tam){Array.new(tam){'A'}}
  	end

  	def copyMat(mat)
  		@matriz = mat
  	end

  	def atack()
		return 1
	end


	def getMatriz()
		return @matriz
	end

	def getTam()
		return @tam
	end

	def cleanMatriz()
		return @matriz = Array.new(@tam){Array.new(@tam){'A'}}
	end

	def devolverFila(fila)
		abc = [*'A'..'J']
		return abc.index(fila)+1
	end

	#verificar
	def verificarsisepuedeponerbarcos (row,colum)
		if (@matriz[row][colum] == "B")
		   return false
		else
		   return true
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

	#def posicionarBarco(tam,colum,row,dir)
	def posicionarBarco(tam,dir,row,colum)
		if(asegurarBarcoEnmatriz(tam,dir,row,colum))
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

	def hayBarcosSinUndir()
		@matriz.each do |chr|
			res = chr.index("B")
			if res != nil
				return true
			end
		end
		return false
	end

  def devolverPosicionEnMatriz(fila, columna)
      return @matriz[fila][columna]
  end

  def devolverResultadoDeAtaque(fila, columna)
    posicion = devolverPosicionEnMatriz(fila,columna)
    if (posicion=="A")
      return "F"
    end
    if (posicion == "B")
      return "X"
    end
  end

  def posicionarElementoEnMatriz(fila,columna,elemento)
    @matriz[fila][columna] = elemento
  end

  def hacerAtaque(fila, columna, matrizObjetivo)
    result = matrizObjetivo.devolverResultadoDeAtaque(fila,columna)
    posicionarElementoEnMatriz(fila,columna,result)
  end







end
