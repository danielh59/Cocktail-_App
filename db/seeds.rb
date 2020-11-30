puts "Seed database"
DrinkApi::Adapter.new.seed_by_name
DrinkApi_V::Adapter.new.seed_by_name
