ENV['RACK_ENV'] = 'test'
require 'twitter.rb'
require 'test/unit'
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end


 
describe "Tests de pagina web y twitter" do

	before :all do

	@usuario1 = "sokartema"
	@usuario2 = "nook1etrolltime"
	@usuario3 = "sokartemafalso"
	

    end	
    

	it "Carga de la web desde el servidor" do
		get '/'
		assert last_response.ok?	
	end

	it "Comprueba el titulo de la pagina" do
		get '/'
		assert last_response.body.include?("<title>Inicio</title>"), "El titulo tiene que ser: Inicio"
	end


end


