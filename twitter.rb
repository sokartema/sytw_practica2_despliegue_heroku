require 'twitter'
require 'sinatra'
require './configure'

get '/' do
  @nombreamigos = []
  @name = ''
  @number = 0
  erb :twitter
end

post '/' do
  @nombreamigos = []
  client = my_twitter_client() 
  @name = params[:nombre] || ''
  @number = params[:numero].to_i
  @number = 1 if @number < 1
  if (client.user? @name) && (@number <= 10)
    ultimos_t = client.friends(@name,{:skip_status => 1, :include_user_entities => false})
    @nombreamigos =(@nombreamigos != '') ? ultimos_t.map{ |i| [i.name ,i.followers_count]} : ''
    @nombreamigos.sort_by!{|a,b| b}.reverse!
    
  end
  erb :twitter
end