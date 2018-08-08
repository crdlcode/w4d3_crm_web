require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/home' do
  erb :home
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end

get '/contacts/:id' do
  @contact = Contact.find_by(:id => params[:id].to_i)
  erb :show_contact
end

after do
  ActiveRecord::Base.connection.close
end
