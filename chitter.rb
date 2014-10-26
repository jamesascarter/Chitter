require 'sinatra'
require 'data_mapper'

enable :sessions
set :session_secret, 'super secret'


env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/peep' # this needs to be done after datamapper is initialised
require './lib/User'
# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

helpers do

def current_user
    @current_user ||=User.get(session[:user_id]) if session[:user_id]
end

end


get '/' do
    @peeps = Peep.all
    erb :index
end

post '/peeps' do
  message = params["message"]
  Peep.create(:message => message)
  redirect to('/')
end

get '/users/new' do
	erb :'users/new'
	end

post '/users' do
	user = User.create(:email => params[:email],
		:password => params[:password],
		:password_confirmation => params[:password_confirmation])
	session[:user_id] = user.id
	redirect to('/')
end
