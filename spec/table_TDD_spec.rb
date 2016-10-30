require 'table'

describe Table do
	before (@each) do
		@tb =Table.new(10)
	end	
	it "Deberia regresar el tamaño del array en 10" do
		resultado = @tb.getMatriz()
		resultado = resultado.count
		resultado.should  == 10
	end

	it "Devuelve un array del array y debe ser igual a en 10" do
		resultado = @tb.getMatriz()
		resultado = resultado[0].count
		resultado.should  == 10
		resultado = @tb.getMatriz()
		resultado = resultado[5].count
		resultado.should  == 10
		resultado = @tb.getMatriz()
		resultado = resultado[9].count
		resultado.should  == 10
	end

	it "Poner un barco en el primer cuadro " do
		@tb.posicionarBarco(1,"v",0,0)
		resultado = @tb.getMatriz()
		resultado = resultado[0][0]
		resultado.should  == 1
		
	end

	it "Poner un barco de tamaño N en el primer cuadro de forma horizontal " do
		@tb.posicionarBarco(3,"h",0,0)
		resultado = @tb.getMatriz()
		resultado = resultado[0].take(3).join(',')
		resultado.should  == "1,1,1"
		
	end

	it "Poner un barco de tamaño N en el primer cuadro a la de forma vertical " do
		@tb.posicionarBarco(3,"v",0,0)
		resultado = @tb.getMatriz()
		resultado =resultado.map {|row| row[0]}.take(3).join(',')
		resultado.should  == "1,1,1"
		
	end

	it "Poner un barco pequeño(1) en una fila y columa dicha " do
		@tb.posicionarBarco(1,"h",2,2)
		resultado = @tb.getMatriz()
		resultado = resultado[2][2]
		resultado.should  == 1

		@tb.posicionarBarco(1,"h",3,1)
		resultado = @tb.getMatriz()
		resultado = resultado[3][1]
		resultado.should  == 1		
	end

	it "Poner un barco de tamaño N en una fila N y columa M de forma horizontal " do
		@tb.posicionarBarco(4,"h",1,3)
		resultado = @tb.getMatriz()
		resultado = resultado[1].drop(3).take(4).join(',')
		resultado.should  == "1,1,1,1"
	end
		

	it "Poner un barco de tamaño N en una fila N y columa M de forma  vertical" do
		@tb.cleanMatriz()
		@tb.posicionarBarco(3,"v",1,2)
		resultado = @tb.getMatriz()
		resultado = resultado.map {|row| row[2]}.drop(1).take(3).join(',')
		resultado.should  == "1,1,1"		
	end

	


end
