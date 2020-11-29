class SessionsController < ApplicationController

    get '/login' do
      if !logged_in? 
        erb :'/users/login'
      else
        @oops = "Hey you're already logged in!"
        redirect '/'
      end
    end 

    post '/login' do
        if params["username"].empty? || params["password"].empty?
          @error  = "Must fill in both input fields"
          erb :'/users/login'
        else 
          if user = User.find_by(username: params["username"], password: params["password"])
                session[:user_id] = user.id
                redirect to '/drinks'
          else
            @error = "Username or password do not match our records. Sign up below"
            erb :'/users/new' 
          end
        end
    end
    
    get "/logout" do
		session.clear
		redirect "/"
	end

end 