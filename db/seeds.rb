puts "Seed database"
DrinkApi::Adapter.new.find_drink_by_name
