require 'game'

describe Game do
	before (@each) do
		@game =Game.new()
	end
	
	it "Deveria devolver el tablero del primer y segundo  jugador vacio" do
		resultado = @game.getBoard1()
		expect(resultado).to match Array.new(10){Array.new(10){'A'}}
		resultado = @game.getBoard2()
		expect(resultado).to match Array.new(10){Array.new(10){'A'}}
	end

	it "Deveria devolver cantidad de barcos del primer y segundo " do
		resultado = @game.getShipPlayer1()
		expect(resultado).to match 5
		resultado = @game.getShipPlayer2()
		expect(resultado).to match 5
	end



	it "Deveria retornar el turno del jugador" do 
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"
	end

	it "Deberia cambiar del turno j1 al j2 y viceversa" do 
		@game.changeTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j2"

		@game.changeTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"
	end

	it "Posicionar un barco en la primera tabla en la posicion B,2" do
		@game.placeShip('B',2)
		resultado = (@game.getBoard1())[1][1]
		expect(resultado).to match "B"
	end

	it "Pasasr de turno y colocar un barco en la posicion A,5 en la segunda tabla" do
		@game.changeTurn()
		@game.placeShip('A',5)
		resultado = (@game.getBoard2())[0][4]
		expect(resultado).to match "B"
	end
	it"Debe devolver true ya que cada jugador tiene barcos que colocar" do 
		resultado = @game.areTherShipsInPlayer1?()
		expect(resultado).to match true

		@game.changeTurn()
		resultado = @game.areTherShipsInPlayer2?()
		expect(resultado).to match true
	end

	it "Deveria devolver fasle despues de que se hayan colocado 5 barcos el jugador 1 " do
		@game.placeShip('A',5)
		@game.placeShip('A',4)
		@game.placeShip('A',3)
		@game.placeShip('A',2)
		@game.placeShip('A',1)
		resultado = @game.areTherShipsInPlayer1?()
		expect(resultado).to match false
	end

	it "Deveria devolver fasle despues de que se hayan colocado 5 barcos el jugador 2 " do
		@game.changeTurn()
		@game.placeShip('A',5)
		@game.placeShip('A',4)
		@game.placeShip('A',3)
		@game.placeShip('A',2)
		@game.placeShip('A',1)
		resultado = @game.areTherShipsInPlayer2?()
		expect(resultado).to match false
	end
end
