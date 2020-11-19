# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:first_name 'Lola', :last_name 'Guérin', :address 'lisbon',
  :phone_number '+33610205610', :is_a_cook :true,
  :bio "I really like to cook asian food. I find my inspirations through
  my travels and a lot of books and chiefs. My Mum it's Italian so I can also
  food a tradition in our culture.", :price 30)


