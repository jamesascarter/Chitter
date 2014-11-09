post '/peeps' do
  message = params["message"]
  Peep.create(:message => message,
              :user_id => session[:user_id])
  redirect to('/')
end

