module DrinkApi_V
    class Adapter
       api_key = "1"
       BASE_URL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=vodka"

        def seed_by_name
            drinksdb = JSON.parse(RestClient.get(BASE_URL))
           
            drinksdb["drinks"].each do |drink|
                @drink = Drink.new(name: drink["strDrink"], pic: drink["strDrinkThumb"], instructions: drink["strInstructions"]
                )
                @drink.save
            end 
        end
    end

end
