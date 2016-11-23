require 'game'

describe Game do
	before (@each) do
		@game =Game.new()
	end
	
	it "Deveria devolver los tableros del primer y segundo jugador vacios al comienzo del juego" do
		resultado = @game.getBoard1()
		expect(resultado).to match Array.new(10){Array.new(10){'A'}}
		resultado = @game.getBoard2()
		expect(resultado).to match Array.new(10){Array.new(10){'A'}}
	end

	it "Deveria devolver la cantidad inicial de barcos que el primer y segundo jugador pueden poner, que es 5" do
		resultado = @game.getShipPlayer1()
		expect(resultado).to match 5
		resultado = @game.getShipPlayer2()
		expect(resultado).to match 5
	end

	it "Deveria retornar el turno del jugador1 (j1)" do 
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"
	end

	it "Cuando se cambia de turno, deberia devolver el turno del j2. Despues se cambia nuevamente y deberia devolver el turno del j1" do 
		@game.changeTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j2"

		@game.changeTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"
	end

	it "Deberia devolver siempre j1 en cualquier caso que se resetee los turnos" do
		@game.changeTurn()
		@game.resetTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"

		@game.resetTurn()
		resultado = @game.returnTurn()
		expect(resultado).to match "j1"
	end

	it "Deberia posicionar un barco en la primera tabla en la posicion dada y deberia devolver que se ha colocado el barco en la tabla" do
		@game.placeShip('B',2)
		resultado = (@game.getBoard1())[1][1]
		expect(resultado).to match "B"
	end

	it "Cuando se cambia de turno al jugador 2, deberia colocar un barco en la posicion dada en la segunda tabla y deberia devuelver que se ha colocado el barco en la tabla" do
		@game.changeTurn()
		@game.placeShip('A',5)
		resultado = (@game.getBoard2())[0][4]
		expect(resultado).to match "B"
	end

	it "Debe validar como positivo cuando un jugador aun tiene barcos que colocar" do 
		resultado = @game.areTherShipsInPlayer1?()
		expect(resultado).to match true

		@game.changeTurn()
		resultado = @game.areTherShipsInPlayer2?()
		expect(resultado).to match true
	end

	it "Deberia validar como negativo despues que el jugador 1 haya colocado sus todos barcos, que son 5, en la tabla" do
		@game.placeShip('A',5)
		@game.placeShip('A',4)
		@game.placeShip('A',3)
		@game.placeShip('A',2)
		@game.placeShip('A',1)
		resultado = @game.areTherShipsInPlayer1?()
		expect(resultado).to match false
	end

	it "Luego de cambiar de turno, deberia validar como negativo despues que el jugador 2 haya colocado sus todos barcos, que son 5, en la tabla" do
		@game.changeTurn()
		@game.placeShip('A',5)
		@game.placeShip('A',4)
		@game.placeShip('A',3)
		@game.placeShip('A',2)
		@game.placeShip('A',1)
		resultado = @game.areTherShipsInPlayer2?()
		expect(resultado).to match false
	end

	it "Al principio del juego nos validara como positivo cuando sea el turno del j1. y como negativo cuando sea el turno del j2" do
		resultado = @game.turnPlayer1?()
		expect(resultado).to match true

		@game.changeTurn()
		resultado = @game.turnPlayer1?()
		expect(resultado).to match false
	end

	it "Como jugador 1 tengo un barco en una posicion dada de mi tabla, y cuando mi oponente ataca a la misma posicion que la de mi barco, me deberia validar en mi tablero, en esa posicion, el ataque acertado (X)" do
		@game.placeShip('A',1)
		@game.changeTurn()
		@game.AttackOpponent('A',1)
		resultado = (@game.getBoard1())[0][0]
		expect(resultado).to match "X"
	end

	it "Deberia validar como negativo cuando un jugador ataca 2 veces en el mismo lugar, lo que seria un error" do
		@game.placeShip('A',1)
		@game.changeTurn()
		@game.AttackOpponent('A',1)
		resultado = @game.checkAttack('A',1)
		expect(resultado).to match false
	end

	it "Deberia regresar nobody (nadie gano aun) cuando a ambos jugadores les quedan por lo menos un barco sin hundir en sus tableros" do	
		@game.placeShip('A',1)
		@game.changeTurn()
		@game.placeShip('B',1)
		resultado = @game.whoWins?()
		expect(resultado).to match "nobody"
	end

	it "Deberia regresar que el jugador 1 ha ganado cuando en su tablero aun hay barcos sin hundir y el jugador 2 tiene todos sus barcos hundidos" do
		@game.placeShip('A',1)
		resultado = @game.whoWins?()
		expect(resultado).to match "Jugador 1 gana!"
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
