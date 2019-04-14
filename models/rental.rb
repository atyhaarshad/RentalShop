require_relative( '../db/sqlrunner' )

class Rental

  attr_reader :id, :customer_id, :stock_id, :date_rented

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @stock_id = options['stock_id']
    @date_rented = options['date_rented']
  end

  def save()
    sql = "INSERT INTO rentals
    (
      customer_id,
      stock_id,
      date_rented
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@customer_id, @stock_id, @date_rented]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM rentals"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    results = SqlRunner.run(sql)
    return results.map { |hash| Rental.new(hash)}
  end

end
