require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/trainer.rb')
require_relative('../models/monster.rb')
also_reload( '../models/*' )

# index
get '/trainers' do
  @trainers = Trainer.all()
  erb( :"trainers/index" )
end

# new
get('/trainers/new')do
  erb( :"trainers/new" )
end

# show
get '/trainers/:id' do
  id = params[:id].to_i()
  @trainers = Trainer.find(id)
  @trainers.monsters
  erb( :"trainers/show" )
end

# create
post('/trainers') do
  Trainer.new(params).save
  redirect to '/trainers'
end

# edit
get("/trainers/:id/edit")do
  id = params[:id].to_i()
  @trainer = Trainer.find(id)
  erb(:"trainers/edit")
end

# update
post("/trainers/:id")do
@trainer = Trainer.new(params)
@trainer.update()
erb(:"trainers/update")
end

# delete
post('/trainers/:id/delete') do
  id = params[:id].to_i()
  @trainer = Trainer.find(id)
  @trainer.delete()
  redirect to '/trainers'
end
