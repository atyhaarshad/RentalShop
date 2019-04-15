require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer.rb')
require_relative('../models/stock.rb')
also_reload('../models/*')

get '/stocks' do
  @stocks = Stock.all()
  erb(:"stocks/index")
end
