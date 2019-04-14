require_relative( '../db/sqlrunner' )

class Customer

  attr_reader :id, :forename, :surname, :dress_size

  def initialize(options)
    @id = options options['id'].to_i if options['id']
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

end
