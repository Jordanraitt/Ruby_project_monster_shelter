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

end
