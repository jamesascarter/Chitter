require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'models/peep' 
require_relative 'models/User'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'


require_relative 'controllers/home'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

set :public_folder, Proc.new { File.join(root, '..', 'public')}
enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb