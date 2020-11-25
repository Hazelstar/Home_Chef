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

user_1 = User.create(email: 'lola@lola.com', password: '123456', first_name: 'Lola', last_name: 'Guérin', address: 'Lisbon', phone_number: '+33607080910',
  is_a_cook: :false, bio: "Hi I'm Lola! I'm super busy, but I love eating homemade. I'm not a fan of French dishes but I adore Asian cuisine.
  In search for the perfect miso soup or even anything related to Japanese cuisine, and I'm discovering Portuguese cuisine nowadays, I love it!
  My kitchen is ready for some action!")
user_2 = User.create(email: 'lucien@lucien.com', password: '123456', first_name: 'Lucien', last_name: 'Andrieux', address: 'Cascais', phone_number: '+33611121314',
  is_a_cook: :true, bio: "My name is Lucien, I'm a French student living in Cascais, Portugal. I love food. I especially love to cook for my friends.
  My specialties are frango assado, caldo verde and even pasteis de nata. As I'm in my last year of master, I do have some time to be a Home Chef for you!", price: 25)
user_3 = User.create(email: 'marion@marion.com', password: '123456', first_name: 'Marion', last_name: 'Gayon', address: 'Lisbon', phone_number: '+33615161718',
  is_a_cook: :true, bio: "I really like to cook asian food. I find my inspirations through
  my travels and a lot of books. I do really like to browse chiefs' online cooking diary to find recipes to experiment.
    My Mum is Italian so I can also prepare Italian dishes as food is a tradition in our culture.", price: 30)
user_4 = User.create(email: 'andre@andre.com', password: '123456', first_name: 'André', last_name: 'Pires', address: 'Lisbon', phone_number: '+351910911912',
  is_a_cook: :true, bio: "Olá I'm André! I'm a full-stack developper, and when I'm not teaching code at le Wagon, I enjoy preparing delicious dishes for my friends.
  I would say that my best dish is homemade pizza!", price: 35)
user_5 = User.create(email: 'emily@emily.com', password: '123456', first_name: 'Emily', last_name: 'Burns', address: 'Lisbon', phone_number: '+351913914915',
  is_a_cook: :true, bio: "Hey I'm Emily! I've been practicing mushroom risotto for the past 5 years (since I tasted THE mushroom risotto
  in Italy while travelling with my boyfriend), and I can tell you that it's the best around town! Book me for special risottos!", price: 50)
user_6 = User.create(email: 'diogo@diogo.com', password: '123456', first_name: 'Diogo', last_name: 'Telo', address: 'Lisbon', phone_number: '+351916917918',
  is_a_cook: :true, bio: "I'm a software developper based in Lisbon and my specialty is pasta. I can make the most fabulous pasta and sauce, with or without meet.
  You can never go wrong with pasta! I also make nice salads and desserts.", price: 20)

booking_1 = Booking.create(number_of_meals: 3, user: user_2, cooker: user_1)
chatroom_1 = Chatroom.create(name:'General', booking: booking_1)
message_1 = Message.create(content: 'Hellooooooo', user: user_1, chatroom: chatroom_1)
message_2 = Message.create(content: 'hello', user: user_2, chatroom: chatroom_1)
