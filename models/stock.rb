class Stock

  attr_reader :id, :name, :category, :size, :designer, :price, :available

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


  # def self.in_stock(id)
  #   sql = "SELECT FROM stock WHERE id = $1"
  #   values = [id]
  #   results = SqlRunner.run(sql, values)
  #   return Stock.new(results.first)
  # end

  # def check_available(stock1)
  #   if .available == true
  #     return "in stock"
  #   else
  #     return "not in stock, sorry"
  #   end
  # end

end
