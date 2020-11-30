class UserController < ApplicationController
    
    get "/signup" do
		  erb :'/users/new'
	  end

    post "/signup" do
      user = User.new(params)
      if user.save
        session[:user_id] = user.id
        redirect '/drinks'
      else
        @error = "Data entry invalid. Must Enter New Username and Password."
        erb :'/users/new'
      end 
    end
   
end 