require 'player'

describe Player do
	before (@each) do
		@jugador =Player.new()
	end
	
	it "Deveria regresar la cantidad de barcos que se ponen en el tablero" do
		resultado = @jugador.getBarcos()
		expect(resultado).to match 5
	end

	it "Debe avisar cuando no haya mas barcos que colocar" do
		@jugador.ponerBarco('A',1)
		@jugador.ponerBarco('A',2)
		@jugador.ponerBarco('A',3)
		@jugador.ponerBarco('A',4)
		@jugador.ponerBarco('A',5)
		resultado = @jugador.hayBarcos()
		expect(resultado).to match false
	end

	it "Debe regresar un tablero limpio" do
		@jugador.ponerBarco('A',1)
		@jugador.limpiarTablero()
		resultado = @jugador.endGame()
		expect(resultado).to match true
	end


	it "Debe regresar un nuevo juego" do
		@jugador.ponerBarco('A',1)
		@jugador.limpiarTablero()
		resultado = @jugador.endGame()
		expect(resultado).to match true
	end


	it "Debe regresar el tablero inicial" do
		resultado = @jugador.getBoard()
		expect(resultado).to match Array.new(10){Array.new(10){'A'}}
	end

	it "Debe mostrar si en el tablero se hizo un ataque exitoso o fallido" do
		#Ataque fallido
		@jugador.hacerAtaque('A', 1)
		resultado = @jugador.getBoard()
		expect(resultado[0][0]).to match 'F'
		#Ataque exitoso
		@jugador.ponerBarco('A',1)
		@jugador.hacerAtaque('A', 1)
		resultado = @jugador.getBoard()
		expect(resultado[0][0]).to match 'X'

	end

end
