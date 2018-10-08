require_relative('../db/sql_runner')

class Trainer

attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO trainers
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
    sql = "UPDATE trainers
    SET name = ($1)
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM trainers;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM trainers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM trainers"
    trainer = SqlRunner.run( sql )
    result = trainer.map { |trainer| Trainer.new( trainer ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM trainers WHERE id = $1"
    values = [id]
    trainer = SqlRunner.run( sql, values )
    result = Trainer.new( trainer.first )
    return result
  end

  def monsters()
    sql = "SELECT * FROM trainers INNER JOIN monsters
    ON trainers.id = monsters.trainer_id
    WHERE trainer_id = $1 "
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |monster| Monster.new(monster) }
  end

end
