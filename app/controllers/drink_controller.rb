class DrinkController < ApplicationController
    
    get '/drinks/new' do
        if logged_in?
        erb :'/drinks/new'
        else 
        redirect '/login'
        end
    end 

    get '/drinks' do  
        if logged_in? 
             @drinks = Drink.all.reverse
            erb :'/drinks/drink_index'
        else 
            redirect '/login'
        end
    end 


    post '/drinks' do
        filter = params.reject{|key, value| key == "pic" && value.empty?}
        drink = current_user.drinks.build(filter)
        drink.pic = nil if drink.pic.empty?
        if !drink.name.empty? && !drink.instructions.empty?
            drink.save
            redirect to '/drinks'
         else
            @error = "Data invalid. Must fill in name and instructions."
         erb :"/drinks/new"
        end
    end

    get '/drinks/:id' do 
        if logged_in?
        @drink = Drink.find_by(id: params["id"])
            if @drink
              erb :"/drinks/show"
            else
                redirect'/drinks'
            end
        else
            redirect '/login'
        end
    end
    
    get '/drinks/:id/edit' do
        @drink = Drink.find(params[:id])
        if current_user == @drink.user
            erb :'/drinks/edit'
        else
            @not_user_error = "Oi, must be owner of this drink to edit."
            redirect  '/'
        end
    end
    
    patch '/drinks/:id' do
        @drink =  Drink.find(params[:id])
        if !params["drink"]["name"].empty? && !params["drink"]["instructions"].empty?
            @drink.update(params["drink"])
            redirect "/drinks/#{params["id"]}"
        else
            @error = "Data invalid. Please try again."
            erb :"/drinks/edit"
        end
    end 
    
    delete '/drinks/:id' do
        drink = Drink.find(params[:id])
        drink.destroy
        redirect '/drinks'
    end

end