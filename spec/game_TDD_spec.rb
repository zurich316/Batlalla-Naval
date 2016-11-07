require 'game'

describe Game do
	before (@each) do
		@game =Game.new()
	end
	
	it "Deveria regresar 5 la cantidad de barcos que se ponen en el tablero" do
		resultado = @game.getBarcos()
		expect(resultado).to match 5
	end

	it "Debe avisar cuando no haya mas barcos que colocar" do
		@game.ponerBarco('A',1)
		@game.ponerBarco('A',2)
		@game.ponerBarco('A',3)
		@game.ponerBarco('A',4)
		@game.ponerBarco('A',5)
		resultado = @game.hayBarcos()
		expect(resultado).to match false
	end

	it "Debe regresar un tablero limpio" do
		@game.ponerBarco('A',1)
		@game.limpiarTablero()
		resultado = @game.endGame()
		expect(resultado).to match true
	end


	it "Debe regresar un nuevo juego" do
		@game.ponerBarco('A',1)
		@game.limpiarTablero()
		resultado = @game.endGame()
		expect(resultado).to match true
	end


	it "Debe regresar el tablero inicial" do
		resultado = @game.getBoard()
		expect(resultado).to match Array.new(10){Array.new(10){'A'}}
	end

	it "Debe mostrar si en el tablero se hizo un ataque exitoso o fallido" do
		#Ataque fallido
		@game.hacerAtaque('A', 1)
		resultado = @game.getBoard()
		expect(resultado[0][0]).to match 'F'
		#Ataque exitoso
		@game.ponerBarco('A',1)
		@game.hacerAtaque('A', 1)
		resultado = @game.getBoard()
		expect(resultado[0][0]).to match 'X'

	end








end
