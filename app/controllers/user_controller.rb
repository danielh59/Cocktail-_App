class UserController < ApplicationController
    
    get "/signup" do
		  erb :'/users/new'
	  end

    post "/signup" do
      user = User.new(params)
      if user.username.empty? || user.password.empty?
        @error = "Data entry invalid. Must Enter New Username and Password."
        erb :'/users/new'
      elsif User.find_by(username: user.username)
        @error = "Username already exist. Please try again." 
        erb :'/users/new'
      else 
        user.save
        session[:user_id] = user.id
        redirect '/drinks'
      end 
    end
   
end 