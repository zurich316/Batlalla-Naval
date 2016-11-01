class	Table 
   	def initialize(tam)  
	    # Instance variables  
	   @matriz = Array.new(tam){Array.new(tam){'-'}}    
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

	def cleanMatriz()
		return @matriz = Array.new(10){Array.new(10){'-'}}    
	end

	def devolverFila(fila)
		abc = [*'A'..'J']
		return abc.index(fila)+1
	end	

	#def posicionarBarco(tam,colum,row,dir)
	def posicionarBarco(tam,dir,row,colum)
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
		
	end

		
end