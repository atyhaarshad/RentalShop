require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer.rb')
require_relative('../models/stock.rb')
also_reload('../models/*')

get '/stocks' do
  @stocks = Stock.all()
  erb(:"stocks/index")
end

get '/stocks/:id' do
  @stock = Stock.find(params['id'].to_i)
  erb(:"stocks/show")
end

get '/stocks/:id/delete' do
  Stock.delete(params[:id])
  redirect to("/stocks")
end

post '/stocks/:id/update' do
  stock = Stock.new(params)
  stock.update()
  redirect to("stocks")
end

post '/stocks' do
  @stock = Stock.new(params)
  @stock.save()
  redirect('/stocks')
end
