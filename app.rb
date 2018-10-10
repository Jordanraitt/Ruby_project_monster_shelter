require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/trainers_controller')
require_relative('controllers/monsters_controller')
require_relative('controllers/breed_controller')

get '/' do
  erb( :index )
end
