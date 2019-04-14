require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer.rb')
also_reload('../models/*')

get '/customer' do
  @customers = Customer.all()
  erb (:"customers/index")
end

get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  erb(:"customers/show")
end
