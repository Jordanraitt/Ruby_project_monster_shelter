require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/trainer.rb')
require_relative('../models/monster.rb')
require_relative('../models/family.rb')
also_reload( '../models/*' )

# index
get '/breed/index' do
  @trainers = Trainer.all()
  erb( :"breed/index" )
end

# assign
get '/breed/:id' do
  id = params[:id].to_i()
  @trainers = Trainer.find(id)
  @trainers.monsters
  erb( :"breed/assign" )
end

# breeding
post 'breed/:id' do
  mf1 = Monster.find(params["monster1_id"])
  mf2 = Monster.find(params["monster2_id"])
  @monster.breed
  erb( :"breed/breeding" )
end
