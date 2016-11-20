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

	

end
