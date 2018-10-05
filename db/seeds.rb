require_relative('../models/trainer.rb')
require_relative('../models/monster.rb')

# Trainer.delete_all()
# Monster.delete_all()

trainer1 = Trainer.new({
  "name" => "Terry"
  })

  trainer1.save

  monster1 = Monster.new({
    "name" => "slime"
    })

  monster2 = Monster.new({
    "name" => "Wing slime"
    })

  monster3 = Monster.new({
    "name" => "Drak slime"
    })

  monster1.save
  monster2.save
  monster3.save
