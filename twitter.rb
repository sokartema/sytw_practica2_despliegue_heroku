require 'twitter'
require 'sinatra'
require './configure'
require 'json'


get '/' do
  @nombreamigos = []
  @name = ''
  @number = 0
  erb :twitter
end

post '/' do
  @nombreamigos = []
  document = ''
  client = my_twitter_client() 
  @name = params[:nombre] || ''
  @number = params[:numero].to_i
  @number = 1 if @number < 1
  if (client.user? @name) && (@number <= 10)

    if(params[:checkbox] != 'on')
    ultimos_t = client.friends(@name,{:skip_status => 1, :include_user_entities => false})
    @nombreamigos =(@nombreamigos != '') ? ultimos_t.map{ |i| [i.name ,i.followers_count]} : ''
    @nombreamigos.sort_by!{|a,b| b}.reverse!

    document = JSON.pretty_generate([{:name => @name , :number => @number} , @nombreamigos])

    file = File.open("json/#{@name}.json", "w")

    file.write(document)

    file.close

    else

      begin

      file = File.read("json/#{@name}.json")

      rescue

      $stderr.puts "Error al abrir el archivo"
  

      else

      @array = JSON.parse(file)
      @nombreamigos = @array[1]

    
      end

    end
   
  end
  erb :twitter
end

get '/json/:nombre' do 

  content_type :json
  document = ''
  @name = params[:nombre]
  @array = []

  begin

  file = File.read("json/#{@name}.json")

  rescue

    document = JSON.pretty_generate({:parameters => "No existe el usuario"})

  else

    @array = JSON.parse(file)
    document = JSON.pretty_generate(@array)

  end


end


