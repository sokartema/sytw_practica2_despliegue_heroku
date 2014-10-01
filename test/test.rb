ENV['RACK_ENV'] = 'test'
require_relative '../twitter.rb'
require 'test/unit'
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

 
describe "Tests de la pagina raiz ('/') con metodo get" do
	

	it "Carga de la web desde el servidor" do
		get '/'
		assert last_response.ok?	
	end
	
	it "Comprueba el titulo de la pagina" do
		get '/'
		assert last_response.body.include?("<title>Inicio</title>"), "El titulo tiene que ser: Inicio"
	end

	it "Comprueba que en la pagina hay una cabecera Most Popular Twitter Friend" do

		get '/'
		assert last_response.body.include?("Twitter Most Popular Friend"), "El titulo de cabecera tiene que estar en el contenido"

	end

	it "Comprueba el contenido del cuadro de texto" do
		get '/'
		assert last_response.body.include?("NºAmigos a mostrar (max 10)"), "El contenido tiene que estar en la web"
	end

	it "Comprueba el mensaje en el campo de visualizacion de amigos" do
		get '/'
		assert last_response.body.include?("No se ha introducido ningun usuario o es incorrecto"), "Tiene que haber un mensaje informativo"

	end	

end


describe "Test de la pagina raiz ('/') con metodo post" do

	#Carga de variables para los tests
	before :all do

		@usuario1 = "sokartema"
		@usuario2 = "nook1etrolltime"
		@usuario3 = "sokartemafalso"
		@number1 = 0
		@number2 = 5
		@number3 = 11
	
	end	

	it "Comprueba mensaje en campo de visualizacion de amigos" do

		post '/', {:nombre => @usuario1, :numero => @number2}

		assert last_response.body.include?("Los amigos mas populares del usuario #{@usuario1} son:"), "Tiene que mostrarse el mensaje"


	end

	it "Comprueba mensaje de error numero mayor en campo visualizacion de amigos" do

		post '/', {:nombre => @usuario2, :numero => @number3}

		assert last_response.body.include?("Error, Sólo se puede mostrar hasta 10 usuarios"), "Tiene que mostrarse el mensaje de error"

	end

	it "Comprueba el mensaje de eror usuario no existe en el campo de visualizacion de amigos" do

		post '/', {:nombre => @usuario3, :numero => @number2}

		assert last_response.body.include?("Error, El usuario no existe o no tiene amigos"), "Tiene que mostrarse el mensaje de error"

	end
	


end



