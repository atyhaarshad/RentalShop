require_relative( '../db/sqlrunner' )
require_relative('rental.rb')
require_relative('stock.rb')

class Customer

  attr_reader :id, :forename, :surname, :dress_size

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @forename = options['forename']
    @surname = options['surname']
    @dress_size = options['dress_size']
  end

  def save()
    sql = "INSERT INTO customers
    (
      forename,
      surname,
      dress_size
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@forename, @surname, @dress_size]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM customers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map { |hash| Customer.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def rentals()
    sql = "SELECT * FROM rentals WHERE customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|rental| Rental.new(rental)}
  end

  def update()
    sql = "UPDATE customers SET
    (forename, surname, dress_size) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@forename, @surname, @dress_size]
    SqlRunner.run(sql, values)
  end

  def stock_info()
    sql = "SELECT s.* FROM stock s INNER JOIN
    rentals r ON r.stock_id = s.id WHERE r.customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |stock| Stock.new(stock)}
  end

  def self.delete(id)
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
