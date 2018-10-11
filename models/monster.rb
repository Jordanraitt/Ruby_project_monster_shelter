require_relative('../db/sql_runner')
require("pry-byebug")


class Monster

attr_reader :id, :name, :family_id
attr_accessor :trainer_id


  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @family_id = options['family_id'].to_i
    @trainer_id = options['trainer_id'].to_i if options['trainer_id']
  end

  def save()
    sql = "INSERT INTO monsters
    (
      name, family_id, trainer_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING *"
    values = [@name, @family_id, @trainer_id]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def update()
      sql = "UPDATE monsters
      SET
      (
        name, family_id, trainer_id

      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @family_id, @trainer_id, @id]
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

  def self.all_available()
    sql = "SELECT * FROM monsters
    WHERE trainer_id is NULL"
    values = [@trainer_id]
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

  def family()
      sql = "SELECT * FROM familys
      WHERE id = $1"
      values = [@family_id]
      results = SqlRunner.run(sql, values)
      return Family.new(results.first)
    end
# breeding method (may break life)

  def self.breed( mf1, mf2 )

    mf1n = mf1.family.name
    mf2n = mf2.family.name

    # monster = SqlRunner.run( sql, values )

    if mf1n== "Slime"
      mf2n == "Dragon"
        return Monster.new({
          "name" => "Drak Slime",
          "family_id" => mf1.family.id
        })
    elsif mf1n == "Dragon"
       mf2n == "Slime"
         return Monster.new({
           "name" => "Dragon Kid",
           "family_id" => mf2.family.id
         })
    elsif mf1n == "Dragon"
       mf2n == "Dragon"
         return Monster.new({
           "name" => "Dragon",
           "family_id" => mf2.family.id
         })
    elsif mf1n == "Slime"
       mf2n == "Slime"
         return Monster.new({
           "name" => "Slime",
           "family_id" => mf1.family.id
         })
    end
      # mf1.delete
      # mf2.delete
  end

end
