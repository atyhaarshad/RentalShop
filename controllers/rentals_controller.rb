require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/customer.rb' )
require_relative( '../models/stock.rb' )
require_relative( '../models/rental.rb' )
also_reload('../models/*')

get '/rentals' do
  @rentals = Rental.all()
  erb(:"rentals/index")
end

get '/rentals/new' do
  @customers = Customer.all
  @stocks = Stock.all
  @rentals = Rental.all
  erb(:"rentals/new")
end

post '/rentals' do
  @rental = Rental.new(params)
  @rental.save()
  redirect to("/rentals")
end

get '/rentals/:id' do
  @rental = Rental.find(params['id'].to_i)
  erb(:"rentals/show")
end

get '/rentals/:id/delete' do
  Customer.delete(params[:id])
  redirect to("/rentals")
end
