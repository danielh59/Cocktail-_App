class DrinkController < ApplicationController
    before do 
        require_session
    end
    
    get '/drinks/new' do
        erb :'/drinks/new'
    end 

    get '/drinks' do  
        @drinks = Drink.all.reverse
        erb :'/drinks/drink_index'
    end 


    post '/drinks' do
        filter = params.reject{|key, value| key == "pic" && value.empty?}
        drink = current_user.drinks.build(filter)
        drink.pic = nil if drink.pic.empty?
        if  drink.save
            redirect to '/drinks'
        else
            @error = "Data invalid. Must fill in name and instructions."
            erb :"/drinks/new"
        end
    end

    get '/drinks/:id' do 
        require_session
        @drink = Drink.find_by(id: params["id"])
        if @drink
          erb :"/drinks/show"
        else
            redirect'/drinks'
        end
    end
    
    get '/drinks/:id/edit' do
        require_session
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