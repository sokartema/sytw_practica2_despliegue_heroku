ENV['RACK_ENV'] = 'test'
require 'twitter.rb'
require 'test/unit'
require 'minitest/autorun'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

before :all do

	@usuario1 = "sokartema"
	@usuario2 = ""
	

end	
 
describe "Number cruncher" do
    
    it "should return the factor" do
        assert_equal(16,12+4,"Resultado")
    end
end


