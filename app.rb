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
  @projects = Project.all
  erb :index
end

get '/divisions/:id' do
  id = params['id'].to_i
  @division = Division.find(id)
  @employees = @division.employees
  erb :division
end

post '/divisions' do
  @divisions = Division.all
  division = Division.create({:title => params['title']})
  erb :index
end

get '/divisions/:id' do
  id = params['id'].to_i
  @division = Division.find(id)
  @employees = @division.employees
  erb :division
end

patch '/divisions/:id' do
  title = params['title']
  @division = Division.find([params['id'].to_i]).first
  @division.update({:title => title})
  erb :division
end

delete '/divisions/:id' do
  division = Division.find([params['id'].to_i]).first
  division.delete
  @divisions = Division.all
  erb :index
end

get '/employees/new' do
  @divisions = Division.all
  erb :employee_form
end

post '/employees' do
  @employees = Employee.all
  @employee = Employee.create({:name => params['name'], :division_id => params['division_id']})
  erb :employees
end

get '/employees' do
  @employees = Employee.all
  erb :employees
end

get '/employees/:id' do
  @employee = Employee.find(params['id'].to_i)
  erb :employee
end

get '/projects/new' do
  erb :project_form
end

post '/projects' do
  @divisions = Division.all
  @projects = Project.all
  project = Project.create({:description => params['description']})
  erb :index
end
