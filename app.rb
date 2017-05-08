require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/employee'
require './lib/division'
require './lib/project'
require 'pry'

also_reload('lib/**/*.rb')

get '/' do
  @divisions = Division.all
  erb :index
end

get '/divisions/:id' do
  id = params['id'].to_i
  @division = Division.find(id)
  erb :division
end

post '/divisions' do
  @divisions = Division.all
  division = Division.create({:title => params['title']})
  erb :index
end
