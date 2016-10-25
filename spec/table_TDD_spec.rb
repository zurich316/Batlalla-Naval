require 'table'

describe Table do
	before (@each) do
		@tb =Table.new
	end	
	it "should return the number as a string" do
		resultado = @tb.atack()
		resultado.should  == 1
	end

end