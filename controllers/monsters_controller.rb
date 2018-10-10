require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/trainer.rb')
require_relative('../models/monster.rb')
require_relative('../models/family.rb')
also_reload( '../models/*' )

# all monsters
get '/monsters' do
@monsters = Monster.all
erb(:"monsters/monsters")
end

# index
get '/monsters/index' do
  @monsters = Monster.all_available()
  erb( :"monsters/index" )
end

# new
get '/monsters/new' do
  @familys = Family.all
  erb( :"monsters/new" )
end


# create
post'/monsters' do
  Monster.new(params).save
  redirect to '/monsters/index'
end

# assign edit
get '/monsters/assign' do
  @monsters = Monster.all_available()
  @trainers = Trainer.all
  erb( :"monsters/assign")
end

# assign update
post '/monsters/index' do
  monster = Monster.find(params["monster_id"])
  monster.trainer_id = params["trainer_id"]
  monster.update
  erb( :"monsters/update")
end

# show
get '/monsters/:id' do
  id = params[:id].to_i()
  @monsters = Monster.find(id)
  @monsters.family
  erb( :"monsters/show" )
end
