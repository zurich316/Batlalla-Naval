require 'game'

describe Game do
	before (@each) do
		@game =Game.new()
	end
	
	it "Deveria devolver el tablero del primer y segundo  jugador vacio al comienzo del juego" do
		resultado = @game.getBoard1()
		expect(resultado).to match Array.new(10){Array.new(10){'A'}}
		resultado = @game.getBoard2()
		expect(resultado).to match Array.new(10){Array.new(10){'A'}}
	end

	it "Deveria devolver cantidad inicial que es 5 barcos del primer y segundo  " do
		resultado = @game.getShipPlayer1()
		expect(resultado).to match 5
		resultado = @game.getShipPlayer2()
		expect(resultado).to match 5
	end

	it "Deveria retornar el turno del jugador1 (j1)" do 
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"
	end

	it "Se cambia de turno y deveria devolver j2. Despues sse cambia nuevamente y y deberia devolver j1" do 
		@game.changeTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j2"

		@game.changeTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"
	end

	it "deberia devolver siempre j1 en cualquier caso" do
		@game.changeTurn()
		@game.resetTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"

		@game.resetTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"
	end

	it "Posicionar un barco en la primera tabla en la posicion B,2 y devuelva el barco(B)" do
		@game.placeShip('B',2)
		resultado = (@game.getBoard1())[1][1]
		expect(resultado).to match "B"
	end

	it "Pasasr de turno al jugador 2 y colocar un barco en la posicion A,5 en la segunda tabla y que devuelve el barco(B)" do
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

	it "Deveria devolver fasle despues de que se hayan colocado 5 barcos el jugador 1 porque ya no tiene mas barcos que colocar " do
		@game.placeShip('A',5)
		@game.placeShip('A',4)
		@game.placeShip('A',3)
		@game.placeShip('A',2)
		@game.placeShip('A',1)
		resultado = @game.areTherShipsInPlayer1?()
		expect(resultado).to match false
	end

	it "Despues de cambiar de turno, deveria devolver fasle despues de que se hayan colocado 5 barcos el jugador 2 porque ya no tiene mas barcos que colocar " do
		@game.changeTurn()
		@game.placeShip('A',5)
		@game.placeShip('A',4)
		@game.placeShip('A',3)
		@game.placeShip('A',2)
		@game.placeShip('A',1)
		resultado = @game.areTherShipsInPlayer2?()
		expect(resultado).to match false
	end

	it "Como es el principio del juego nos devolvera true porque es el turno del j1. Si cambiamos de turno al j2 nos regresara false" do
		resultado = @game.turnPlayer1?()
		expect(resultado).to match true

		@game.changeTurn()
		resultado = @game.turnPlayer1?()
		expect(resultado).to match false
	end

	it "Como jugador 1 coloco un barco en la posicion (A,1) y luego le toca a mi oponente que ataca la misma posicion, me deveria devolver mi tablero en esa posicion X(ataque acertado)" do
		@game.placeShip('A',1)
		@game.changeTurn()
		@game.AttackOpponent('A',1)
		resultado = (@game.getBoard1())[0][0]
		expect(resultado).to match "X"
	end

	it "Como jugador 1 coloco mi barco en la posicion (A,1) y luego le toca a mi oponente que ataca dos veces en el mismo lugar y me deveria devolver false ya que es un error atacar dos veces en el mismo lugar" do
		@game.placeShip('A',1)
		@game.changeTurn()
		@game.AttackOpponent('A',1)
		resultado = @game.checkAttack('A',1)
		expect(resultado).to match false
	end

	it "deberia regresar nobody, nadie gano aun, proque ambos jugadores les quedan un barco" do	
		@game.placeShip('A',1)
		@game.changeTurn()
		@game.placeShip('B',1)
		resultado = @game.whoWins?()
		expect(resultado).to match "nobody"
	end

	it "deberia regresar Player 1 Wins! porque en el tablero del judaro 1 aun hay barcos y ya no hay ninguna donde el jugador 2" do
		@game.placeShip('A',1)
		resultado = @game.whoWins?()
		expect(resultado).to match "Player 1 Wins!"
	end
=begin
	it "deberia regresar true ya que ninguno de los jugadores tiene barcos en sus tableros" do
		resultado = @game.someoneLose?()
		expect(resultado).to match true
	end

	it "deberia regresar false ya que el juego sigue porque ambos jugadores tienen un barco en el tablero " do
		@game.placeShip('A',1)
		@game.changeTurn()
		@game.placeShip('B',1)
		resultado = @game.someoneLose?()
		expect(resultado).to match false
	end
=end
end
