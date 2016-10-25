class	Table
	 
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
		
end