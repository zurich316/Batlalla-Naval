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

	it "Deberia devolver el tamaño que se le dio a la matriz" do
		resultado = @tb.getTam()
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

	it "Devolver el numero de la fila dada una letra de la A a la J" do
		resultado = @tb.devolverFila('A')
		resultado.should  == 1
		resultado = @tb.devolverFila('C')
		resultado.should  == 3
		resultado = @tb.devolverFila('H')
		resultado.should  == 8
		resultado = @tb.devolverFila('J')
		resultado.should  == 10
	end

	it "Poner un barco en el primer cuadro " do
		@tb.posicionarBarco(1,"v",'A',1)
		resultado = @tb.getMatriz()
		resultado = resultado[0][0]
		resultado.should  == 'B'

	end

	it "Poner un barco de tamaño N en el primer cuadro de forma horizontal " do
		@tb.posicionarBarco(3,"h",'A',1)
		resultado = @tb.getMatriz()
		resultado = resultado[0].take(3).join(',')
		resultado.should  == "B,B,B"

	end

	it "Poner un barco de tamaño N en el primer cuadro a la de forma vertical " do
		@tb.posicionarBarco(3,"v",'A',1)
		resultado = @tb.getMatriz()
		resultado =resultado.map {|row| row[0]}.take(3).join(',')
		resultado.should  == "B,B,B"

	end

	it "Poner un barco pequeño(1) en una fila y columa dicha " do
		@tb.posicionarBarco(1,"h",'C',3)
		resultado = @tb.getMatriz()
		resultado = resultado[2][2]
		resultado.should  == 'B'

		@tb.posicionarBarco(1,"h",'D',2)
		resultado = @tb.getMatriz()
		resultado = resultado[3][1]
		resultado.should  == 'B'
	end

	it "Poner un barco de tamaño N en una fila N y columa M de forma horizontal " do
		@tb.posicionarBarco(4,"h",'B',4)
		resultado = @tb.getMatriz()
		resultado = resultado[1].drop(3).take(4).join(',')
		resultado.should  == "B,B,B,B"
	end


	it "Poner un barco de tamaño N en una fila N y columa M de forma  vertical" do
		@tb.cleanMatriz()
		@tb.posicionarBarco(3,"v",'B',3)
		resultado = @tb.getMatriz()
		resultado = resultado.map {|row| row[2]}.drop(1).take(3).join(',')
		resultado.should  == "B,B,B"
	end

	it "Debe asegurar que el barco no se salga de la matriz" do
		resultado = @tb.asegurarBarcoEnmatriz(1,'h','J',10)
		resultado.should  == true
		resultado = @tb.asegurarBarcoEnmatriz(2,'v','J',6)
		resultado.should  == false
		resultado = @tb.asegurarBarcoEnmatriz(10,'v','A',1)
		resultado.should  == true
		resultado = @tb.asegurarBarcoEnmatriz(10,'h','A',1)
		resultado.should  == true
		resultado = @tb.asegurarBarcoEnmatriz(11,'v','A',1)
		resultado.should  == false
		resultado = @tb.asegurarBarcoEnmatriz(11,'h','A',1)
		resultado.should  == false
	end

	it "Verificar posicionar un barco en posicion sobre otro barco"	do
	    @tb.cleanMatriz()
		@tb.posicionarBarco(3,"v",'B',3)
		resultado = @tb.verificarsisepuedeponerbarcos(3,3)
		resultado.should == true
	end

	it "Deberia retornar false si no hay mas barcos sin atacar" do
		@tb.cleanMatriz()
		expect(@tb.hayBarcosSinUndir()).to match false
	end

	it "Deberia retornar true si hay mas barcos para atacar" do
		@tb.cleanMatriz()
		@tb.posicionarBarco(1,"h","E",9)
		expect(@tb.hayBarcosSinUndir()).to match true
	end

	it "Deberia devolver el elemento en una posicion de la matriz" do
		@tb.cleanMatriz()
		expect(@tb.devolverPosicionEnMatriz(5,5)).to match "A"
	end

	it "Deberia devolver X si el ataque fue acertado" do
		@tb.cleanMatriz()
		@tb.posicionarBarco(1,"h","A",1)
		expect(@tb.devolverResultadoDeAtaque(0,0)).to match "X"
	end

	it "Deberia devolver F si el ataque fue fallado" do
		@tb.cleanMatriz()
		expect(@tb.devolverResultadoDeAtaque(0,0)).to match "F"
	end

	it "Deberia guardar el elemento en una posicion" do
		@tb.cleanMatriz()
		@tb.posicionarElementoEnMatriz(0,0,"B")
		expect(@tb.devolverPosicionEnMatriz(0,0)).to match "B"
	end

	it "Deberia marcar en la matriz de ataques un ataque acertado" do
		@tb2 = Table.new(10)
		@tb2.cleanMatriz()
		@tb.cleanMatriz()
		@tb2.posicionarElementoEnMatriz(0,0,"B")
		@tb.hacerAtaque(0,0,@tb2)
		expect(@tb.devolverPosicionEnMatriz(0,0)).to match "X"
	end



end
