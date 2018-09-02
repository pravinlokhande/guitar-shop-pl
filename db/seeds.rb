# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brand_names = %w{ Fender_Stratocaster Gibson_Les_Paul Taylor Epiphone Yamaha Ibanez}
models = %w{ Electric Acoustic }



models.each do |g_model|
  brand_names.each do |brand|
    Guitar.create(uid: rand(1111..9999), description: "This Guitar is of brand: #{brand} and model: #{g_model}.", brand: brand, model: g_model, price: rand(1000..9999))
  end
end