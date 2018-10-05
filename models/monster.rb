require_relative('../db/sql_runner')

class Monster

attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO monsters
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

  def update()
      sql = "UPDATE monsters
      SET
      (
        name

      ) =
      (
        $1
      )
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run( sql, values )
    end

  def self.delete_all()
    sql = "DELETE FROM monsters;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM monsters
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM monsters"
    monster = SqlRunner.run( sql )
    result = monster.map { |monster| Monster.new( monster ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM monsters WHERE id = $1"
    values = [id]
    monster = SqlRunner.run( sql, values )
    result = Monster.new( monster.first )
    return result
  end

end
