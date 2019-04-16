require_relative( '../db/sqlrunner' )
require_relative( 'customer.rb' )
require_relative( 'rental.rb' )

class Stock

  attr_reader :name, :category, :size, :designer, :price, :available
  attr_accessor :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @size = options['size']
    @designer = options['designer']
    @price = options['price']
    @available = options['available']
  end

  def save()
    sql = "INSERT INTO stocks
    (
      name,
      category,
      size,
      designer,
      price,
      available
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @category, @size, @designer, @price, @available]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM stocks"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM stocks WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM stocks"
    results = SqlRunner.run(sql)
    return results.map { |hash| Stock.new(hash)}
  end

  def rentals()
    sql = "SELECT * FROM rentals WHERE dress_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|rental| Rental.new(rental)}
  end

  def self.find(id)
    sql = "SELECT * FROM stocks WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Stock.new(results.first)
  end

  def customer_info()
    sql = "SELECT c.* FROM customers c INNER JOIN rentals r
    ON r.customer_id = c.id WHERE r.stock_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|customer| Customer.new(customer)}
  end

  def update()
    sql = "UPDATE stocks SET
    (name, category, size, designer, price, available) =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @category, @size, @designer, @price, @available, @id]
    SqlRunner.run(sql, values)
  end

  def rented_stock()
    sql = "SELECT * FROM stocks WHERE available = true"
    results = SqlRunner(sql)
    return results.map { |stock|Stock.new(stock)  }
  end

end
