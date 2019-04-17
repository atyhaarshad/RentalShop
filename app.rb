require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customers_controller')
require_relative('controllers/stocks_controller')
require_relative('controllers/rentals_controller')


get '/' do
  erb( :index )
end

get '/about' do
  erb( :show)
end
