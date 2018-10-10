require_relative('../db/sql_runner')

class Family

attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO familys
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM familys;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM familys
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM familys"
    family = SqlRunner.run( sql )
    result = family.map { |family| Family.new( family ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM familys WHERE id = $1"
    values = [id]
    family = SqlRunner.run( sql, values )
    result = Family.new( family.first )
    return result
  end
  
end
