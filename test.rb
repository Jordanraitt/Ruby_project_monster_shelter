def breed( mf1, mf2 )

  mf1 = mf1.family.name
  mf2 = mf2.family.name

  if mf1 == "Slime"
    mf2 == "Dragon"
      return Monster.new({
        "name" => "Drak Slime",
        "family_id" => family1.id
      })
  elsif mf1 == "Dragon"
     mf2 == "Slime"
       return Monster.new({
         "name" => "Dragon Kid",
         "family_id" => family2.id
       })
  elsif mf1 == "Dragon"
     mf2 == "Dragon"
       return Monster.new({
         "name" => "Dragon",
         "family_id" => family2.id
       })
  elsif mf1 == "slime"
     mf2 == "Slime"
       return Monster.new({
         "name" => "Slime",
         "family_id" => family1.id
       })
  end
    mf1.delete
    mf2.delete
end
