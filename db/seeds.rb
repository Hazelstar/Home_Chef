# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(first_name: 'Lola', last_name: 'Guérin', address: 'lisbon',
#   phone_number: '+33610205610', is_a_cook: true,
#   bio: "I really like to cook asian food. I find my inspirations through
#   my travels and a lot of books and chiefs. My Mum it's Italian so I can also
#   food a tradition in our culture.", price: 30)


# User.create(first_name: 'marion', last_name: 'G', address: 'lisbon',
#   phone_number: '+336000000', is_a_cook: true,
#   bio: "I really like to cook asian food. I find my inspirations through
#   my travels and a lot of books and chiefs. My Mum it's Italian so I can also
#   food a tradition in our culture.", price: 2)
Message.destroy_all

Chatroom.destroy_all

Booking.destroy_all
User.destroy_all


user_1 = User.create(email:'me@me.com', password:'123456')
user_2 = User.create(email:'lilou@lilou.com', password:'123456')
booking_1 = Booking.create(number_of_meals: 3, user: user_2, cooker: user_1)

chatroom_1 = Chatroom.create(name:'general', booking: booking_1)

message_1 = Message.create(content: 'hellooooooo', user: user_1, chatroom: chatroom_1)
message_2 = Message.create(content: 'hello', user: user_2, chatroom: chatroom_1)
