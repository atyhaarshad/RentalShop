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

get '/rentals/:id' do
  @rental = Rental.find(params['id'].to_i)
  erb(:"rentals/show")
end
