require 'player'

describe Player do
	before (@each) do
		@player =Player.new()
	end
	it "Deberia regresar el tamaño del tablero en 10" do
		resultado = @player.getBoard().count
		expect(resultado).to match 10
	end

	it "Deberia regresar un tablero vacio al principio del juego" do
		resultado = @player.BoardEmpty?()
		expect(resultado).to match true
	end


	it "Deberia regresar 5 que es la cantidad inicial de barcos de un jugador" do
		resultado = @player.getShips()
		expect(resultado).to match 5
	end 

	it "Devolver el numero de la fila dada una letra de la A que incia con 0 a la J que termina con 9" do
		resultado = @player.returnRow('A')
		expect(resultado).to match 0
		resultado = @player.returnRow('C')
		expect(resultado).to match 2
		resultado = @player.returnRow('H')
		expect(resultado).to match 7
		resultado = @player.returnRow('J')
		expect(resultado).to match 9
	end

	it "Deberia devolver A(agua) porque el tablero incia ccon agua en todos sus campos " do
		resultado = @player.returnElementFromBoard(5,5)
		expect(resultado).to match "A"
	end

	it "Deberia regresarnos X el elemento que posicionamos en el espacio (0,0)" do
		@player.placeElementInTheBoard(0,0,"X")
		resultado = @player.returnElementFromBoard(0,0)
		expect(resultado).to match "X"
	end

	it "deveria devolver true ya que el tablero esta vacio, pero si le ponemos algun elemento este nos devuelve false" do
		resultado =  @player.BoardEmpty?()
		expect(resultado).to match true

		@player.placeElementInTheBoard(0,0,"X")
		resultado =  @player.BoardEmpty?()
		expect(resultado).to match false
	end

	it "Deveria devolver true ya que despues de colocar un elemento en el tablero lo limpiamoz y todo se convierte en agua(A)" do
		@player.placeElementInTheBoard(0,0,"X")
		@player.resetBoard()
		resultado =  @player.BoardEmpty?()
		expect(resultado).to match true
	end

	it "Poner un barco en el primer cuadro (A,1) y debe regresarnos una B (Barco) de esa posicion" do
		@player.placeShip('A',1)
		resultado = @player.returnElementFromBoard(0,0)	
		expect(resultado).to match 'B'
	end


	it "Despues de colocar los 5 barcos que tiene el jugador, me devuelva false porque ya no hay barcos" do
		@player.placeShip('A',1)
		@player.placeShip('A',2)
		@player.placeShip('A',3)
		@player.placeShip('A',4)
		@player.placeShip('A',5)
		resultado = @player.areThereShips?()
		expect(resultado).to match false
	end

	it "Despues de colocar los 1 barco y de resetear el numero de barcos del jugador deberia devolver 5" do
		@player.placeShip('A',1)
		@player.resetShips()
		resultado = @player.getShips()
		expect(resultado).to match 5
	end



	it "Deberia devolver true al verificar cualquier lugar porque no colocamos ningun barco en el tablero"	do
		resultado = @player.checkPlaceShip('A',1)
		resultado.should == true
	end
	it "Deberia devolver false ya que despues de colocar un barco en el (B,3) verificamos si se puede colocar un barco en el mismo lugar"	do
		@player.placeShip('B',3)
		resultado = @player.checkPlaceShip('B',3)
		resultado.should == false
	end

	it "Deberia retornar false si no hay mas barcos en el tablero" do
		resultado = @player.isThereShipsInTheBoard?()
		expect(resultado).to match false
	end

	it "Deberia retornar true ya que pusimos un barco en la posicion (E,9) y el tablero tiene un barco" do
		@player.placeShip("E",9)
		resultado = @player.isThereShipsInTheBoard?()
		expect(resultado).to match true
	end

	it "Deberia devolver X(ataque acertado) ya el ataque cae en un barco, previamente colocado, en la posicion (A,1)" do
		@player.placeShip("A",1)
		@player.Attack!('A',1)
		resultado = @player.returnElementFromBoard(0,0)
		expect(resultado).to match "X"

	end

	it "Deberia devolver F(Ataque fallido) porque mandamos un ataque a la posicion (A,1) que es A(agua) " do
		@player.Attack!('A',1)
		resultado = @player.returnElementFromBoard(0,0)
		expect(resultado).to match "F"
	end

	it "Deberia devolver false ya que un ataque se realizo dos veces en la posicion (A,1), pero luego devuele true cuando se desea atacar en la posicion (A,2)" do
		@player.Attack!('A',1)
		resultado = @player.checkAttack('A',1)
		expect(resultado).to match false

		resultado = @player.checkAttack('A',2)
		expect(resultado).to match true

	end

	it "Deberia establecer la cantidad de barcos para poner segun la cantidad ingresada" do
		@player.setShips(10)
		resultado = @player.getShips()
		expect(resultado).to match 10
	end

=begin
	it "Devuelve un array del array y debe ser igual a en 10" do
		resultado = @player.getBoard()
		resultado = resultado[0].count
		expect(resultado).to match 10
		resultado = @player.getBoard()
		resultado = resultado[5].count
		expect(resultado).to match 10
		resultado = @tb.getBoard()
		resultado = resultado[9].count
		expect(resultado).to match 10
	end
=end
=begin

	it "Poner un barco de tamaño N en el primer cuadro a la de forma vertical " do
		@tb.placeShip('A',1)
		resultado = @tb.getBoard()
		resultado =resultado.map {|row| row[0]}.take(3).join(',')
		expect(resultado).to match "B,B,B"

	end

	it "Poner un barco pequeño(1) en una fila y columa dicha " do
		@tb.placeShip(1,"h",'C',3)
		resultado = @tb.getBoard()
		resultado = resultado[2][2]
		resultado.should  == 'B'

		@tb.placeShip(1,"h",'D',2)
		resultado = @tb.getBoard()
		resultado = resultado[3][1]
		resultado.should  == 'B'
	end

	it "Poner un barco de tamaño N en una fila N y columa M de forma horizontal " do
		@tb.posicionarBarco(4,"h",'B',4)
		resultado = @tb.getBoard()
		resultado = resultado[1].drop(3).take(4).join(',')
		resultado.should  == "B,B,B,B"
	end


	it "Poner un barco de tamaño N en una fila N y columa M de forma  vertical" do
		@tb.resetMatriz()
		@tb.posicionarBarco(3,"v",'B',3)
		resultado = @tb.getBoard()
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
		resultado = @tb.getBoard()
		resultado = resultado[0].take(3).join(',')
		resultado.should  == "B,B,B"

	end

=end


end
