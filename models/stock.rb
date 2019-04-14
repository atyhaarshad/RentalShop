class Stock

  attr_reader :id, :name, :category, :size, :designer, :price, :available

  def initialize(options)
    @id = options options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
    @size = options['size']
    @designer = options['designer']
    @price = options['price']
    @available = options['available']
  end

  def save()
    sql = "INSERT INTO stock
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

end
