require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'

get '/' do
erb :index
end




post '/result' do
search_str = params[:movie] #that gets back the movie we're requesting
response= Typhoeus.get("www.omdbapi.com", :params=> {:s =>search_str})

result=JSON.parse(response.body)
@sorted_by_year=result["Search"].sort_by{ |movie_hash| movie_hash["Year"]}


  erb :result
end




get '/poster/:imdb' do |imdb_id|
id=params[:imdb]
response_ID= Typhoeus.get("www.omdbapi.com", :params=> {:i =>id})
@result_ID=JSON.parse(response_ID.body)

erb :poster
  
end

