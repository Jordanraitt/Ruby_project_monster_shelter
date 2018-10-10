require_relative('../models/trainer.rb')
require_relative('../models/family.rb')
require_relative('../models/monster.rb')
require("pry-byebug")

Monster.delete_all()
Family.delete_all()
Trainer.delete_all()

trainer1 = Trainer.new({
  "name" => "Terry"
  })

trainer1.save

family1 = Family.new({
  "name" => "Slime"
  })

family2 = Family.new({
  "name" => "Dragon"
  })

family1.save
family2.save

monster1 = Monster.new({
  "name" => "Slime",
  "family_id" => family1.id,
  "trainer_id" => trainer1.id
})

monster2 = Monster.new({
  "name" => "Wing slime",
  "family_id" => family1.id
})

monster3 = Monster.new({
  "name" => "Drak slime",
  "family_id" => family1.id
})

monster4 = Monster.new({
  "name" => "Dragon Kid",
  "family_id" => family2.id
})

monster1.save
monster2.save
monster3.save
monster4.save

trainer1.monsters
monster1.family
Monster.all_available

binding.pry
nil
