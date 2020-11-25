# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
Chatroom.destroy_all
Booking.destroy_all
User.destroy_all

user_1 = User.create(email:'lucien@lucien.com', password:'123456', first_name: 'Lucien', last_name: "Andrieux", is_a_cook: :true)
user_2 = User.create(email:'marion@marion.com', password:'123456', first_name: 'Marion')
user_3 = User.create(first_name: 'Lola', last_name: 'Guérin', address: 'Lisbon', phone_number: '+33610205610',
  is_a_cook: :true, bio: "I really like to cook asian food. I find my inspirations through
  my travels and a lot of books and chiefs. My Mum it's Italian so I can also
  food a tradition in our culture.", price: 30)

<<<<<<< HEAD
user_1 = User.create(first_name: "meme", last_name: "meme", email:'me@me.com', password:'123456')
user_2 = User.create(first_name: "lola", last_name: "lola", email:'lilou@lilou.com', password:'123456')
=======
>>>>>>> master
booking_1 = Booking.create(number_of_meals: 3, user: user_2, cooker: user_1)
chatroom_1 = Chatroom.create(name:'General', booking: booking_1)
message_1 = Message.create(content: 'Hellooooooo', user: user_1, chatroom: chatroom_1)
message_2 = Message.create(content: 'hello', user: user_2, chatroom: chatroom_1)
