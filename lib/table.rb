class	Table 
   	def initialize(tam)  
	    # Instance variables  
	   @matriz = Array.new(tam){Array.new(tam){0}}    
  	end 

  	def copyMat(mat)
  		@matriz = mat
  	end

  	def atack()
		
		return 1
	end

	def generarMatriz(largo)
	  matriz = []
	  aux =[]
	  for   a in 0..largo-1
	    for b in 0..largo-1
	      aux[b] = 0
	    end
	    matriz[a] = aux
	    aux=[]
	  end
	  return matriz		
	end

	def getMatriz()
		return @matriz
	end

	def cleanMatriz()
		return @matriz = Array.new(10){Array.new(10){0}}    
	end

	#def posicionarBarco(tam,colum,row,dir)
	def posicionarBarco(tam,dir,row,colum)
		count = 0
		if(dir=="h")
			while count < tam
				@matriz[row][count+colum] = 1
				count+=1
			end
		else
			while count < tam
				@matriz[row+count][colum] = 1
				count+=1
			end
		end
		
	end

		
end