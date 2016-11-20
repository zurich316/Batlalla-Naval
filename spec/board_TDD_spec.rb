require 'board'

describe Board do
	before (@each) do
		@tb =Board.new()
	end
	it "Deberia regresar el tamaño del tablero en 10" do
		resultado = @tb.retornarTablero().count
		expect(resultado).to match 10
	end

	it "Devolver el numero de la fila dada una letra de la A a la J" do
		resultado = @tb.devolverFila('A')
		expect(resultado).to match 0
		resultado = @tb.devolverFila('C')
		expect(resultado).to match 2
		resultado = @tb.devolverFila('H')
		expect(resultado).to match 7
		resultado = @tb.devolverFila('J')
		expect(resultado).to match 9
	end

	it "Deberia devolver el elemento en una posicion de la matriz" do
		resultado = @tb.devolverElementoDeLaMatriz(5,5)
		expect(resultado).to match "A"
	end

	it "Deberia guardar el elemento en una posicion" do
		@tb.posicionarElementoEnMatriz(0,0,"X")
		resultado = @tb.devolverElementoDeLaMatriz(0,0)
		expect(resultado).to match "X"
	end

	it "Debe verificar si el tablero esta vacio o si tiene algun elemento que no sea agua" do
		resultado =  @tb.verificarTableroVacio()
		expect(resultado).to match true

		@tb.posicionarElementoEnMatriz(0,0,"X")
		resultado =  @tb.verificarTableroVacio()
		expect(resultado).to match false
	end

	it "Debe verificar si el tablero se  limpio" do
		@tb.posicionarElementoEnMatriz(0,0,"X")
		@tb.cleanBoard()
		resultado =  @tb.verificarTableroVacio()
		expect(resultado).to match true
	end

	it "Poner un barco en el primer cuadro " do
		@tb.posicionarBarco('A',1)
		resultado = (@tb.retornarTablero())[0][0]	
		expect(resultado).to match 'B'
	end

	it "Verificar posicionar un barco en posicion sobre otro barco"	do
		resultado = @tb.verificarsisepuedeponerbarcos('A',1)
		resultado.should == true

		@tb.posicionarBarco('B',3)
		resultado = @tb.verificarsisepuedeponerbarcos('B',3)
		resultado.should == false
	end

	it "Deberia retornar false si no hay mas barcos en el tablero" do
		resultado = @tb.hayBarcosEnElTablero?()
		expect(resultado).to match false
	end

	it "Deberia retornar true si hay barcos en el tablero" do
		@tb.posicionarBarco("E",9)
		resultado = @tb.hayBarcosEnElTablero?()
		expect(resultado).to match true
	end

	it "Deberia devolver el resultado si un ataque es acertado" do
		@tb.posicionarBarco("A",1)
		@tb.hacerAtaque('A',1)
		resultado = @tb.devolverElementoDeLaMatriz(0,0)
		expect(resultado).to match "X"

	end

	it "Deberia devolver el resultado si un ataque no es acertado" do
		@tb.posicionarBarco("A",0)
		@tb.hacerAtaque('A',1)
		resultado = @tb.devolverElementoDeLaMatriz(0,0)
		expect(resultado).to match "F"
	end

	it "Debe verificar si el ataque se ejecuto en el mismo lugar" do
		@tb.hacerAtaque('A',1)
		resultado = @tb.verificarAtaque('A',1)
		expect(resultado).to match false

		resultado = @tb.verificarAtaque('A',2)
		expect(resultado).to match true

	end

=begin
	it "Devuelve un array del array y debe ser igual a en 10" do
		resultado = @tb.retornarTablero()
		resultado = resultado[0].count
		expect(resultado).to match 10
		resultado = @tb.retornarTablero()
		resultado = resultado[5].count
		expect(resultado).to match 10
		resultado = @tb.retornarTablero()
		resultado = resultado[9].count
		expect(resultado).to match 10
	end
=end
=begin

	it "Poner un barco de tamaño N en el primer cuadro a la de forma vertical " do
		@tb.posicionarBarco('A',1)
		resultado = @tb.retornarTablero()
		resultado =resultado.map {|row| row[0]}.take(3).join(',')
		expect(resultado).to match "B,B,B"

	end

	it "Poner un barco pequeño(1) en una fila y columa dicha " do
		@tb.posicionarBarco(1,"h",'C',3)
		resultado = @tb.retornarTablero()
		resultado = resultado[2][2]
		resultado.should  == 'B'

		@tb.posicionarBarco(1,"h",'D',2)
		resultado = @tb.retornarTablero()
		resultado = resultado[3][1]
		resultado.should  == 'B'
	end

	it "Poner un barco de tamaño N en una fila N y columa M de forma horizontal " do
		@tb.posicionarBarco(4,"h",'B',4)
		resultado = @tb.retornarTablero()
		resultado = resultado[1].drop(3).take(4).join(',')
		resultado.should  == "B,B,B,B"
	end


	it "Poner un barco de tamaño N en una fila N y columa M de forma  vertical" do
		@tb.cleanMatriz()
		@tb.posicionarBarco(3,"v",'B',3)
		resultado = @tb.retornarTablero()
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

	it "Poner un barco de tamaño N en el primer cuadro de forma horizontal " do
		@tb.posicionarBarco(3,"h",'A',1)
		resultado = @tb.retornarTablero()
		resultado = resultado[0].take(3).join(',')
		resultado.should  == "B,B,B"

	end

=end


end
