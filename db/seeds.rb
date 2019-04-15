require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require_relative( "../models/stock.rb" )
require("pry-byebug")

Rental.delete_all()
Customer.delete_all()
Stock.delete_all()

customer1 = Customer.new({
  "forename" => "Beyonce",
  "surname" => "Knowles",
  "dress_size" => 10
})
customer1.save()

customer2 = Customer.new({
  "forename" => "Angelina",
  "surname" => "Jolie",
  "dress_size" => 8
})
customer2.save()

customer3 = Customer.new({
  "forename" => "Taylor",
  "surname" => "Swift",
  "dress_size" => 8
})
customer3.save()

customer4 = Customer.new({
  "forename" => "Rihanna",
  "surname" => "Fenty",
  "dress_size" => 10
})
customer4.save()

customer5 = Customer.new({
  "forename" => "Jennifer",
  "surname" => "Lawrence",
  "dress_size" => 8
})
customer5.save()

dress1 = Stock.new({
  "name" => "Long Black Lace Dress",
  "category" => "party dress",
  "designer" => "Gucci",
  "size" => 10,
  "price" => 500,
  "available" => false
})
dress1.save()

dress2 = Stock.new({
  "name" => "Snakeskin Print Gown",
  "category" => "evening dress",
  "designer" => "Elie Saab",
  "size" => 10,
  "price" => 600,
  "available" => true
})
dress2.save()

dress3 = Stock.new({
  "name" => "Long-sleeved Red Dress",
  "category" => "evening dress",
  "size" => 8,
  "designer" => "Prada",
  "price" => 800,
  "available" => true
})
dress3.save()

dress4 = Stock.new({
  "name" => "Crystal Embellished Gown",
  "category" => "evening dress",
  "size" => 10,
  "designer" => "Zuhair Murad",
  "price" => 750,
  "available" => true
})
dress4.save()

dress5 = Stock.new({
  "name" => "Black dress",
  "category" => "party dress",
  "size" => 10,
  "designer" => "Christian Dior",
  "price" => 300,
  "available" => true
})
dress5.save()

dress6 = Stock.new({
  "name" => "test",
  "category" => "test",
  "size" => 10,
  "designer" => "test",
  "price" => 300,
  "available" => true
})
dress6.save()

rental1 = Rental.new({
  "customer_id" => customer1.id,
  "stock_id" => dress2.id,
  "date_rented" => "Apr-14-2019"
})
rental1.save()

rental2 = Rental.new({
  "customer_id" => customer2.id,
  "stock_id" => dress4.id,
  "date_rented" => "Apr-14-2019"
})
rental2.save()

rental3 = Rental.new({
  "customer_id" => customer3.id,
  "stock_id" => dress3.id,
  "date_rented" => "Apr-14-2019"
})
rental3.save()

rental4 = Rental.new({
  "customer_id" => customer4.id,
  "stock_id" => dress1.id,
  "date_rented" => "Apr-14-2019"
})
rental4.save()

rental5 = Rental.new({
  "customer_id" => customer5.id,
  "stock_id" => dress5.id,
  "date_rented" => "Apr-14-2019"
})
rental5.save()

binding.pry()
nil
