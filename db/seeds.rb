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

booker_1 = User.create(email: 'lola@lola.com', password: '123456', first_name: 'Lola', last_name: 'Guérin', address: 'Lisbon', phone_number: '+33607080910',
  is_a_cook: :false, bio: "Hi I'm Lola! I'm super busy, but I love eating homemade. I'm not a fan of French dishes but I adore Asian cuisine.
  In search for the perfect miso soup or even anything related to Japanese cuisine, and I'm discovering Portuguese cuisine nowadays, I love it!
  My kitchen is ready for some action!")
cooker_1 = User.create(email: 'lucien@lucien.com', password: '123456', first_name: 'Lucien', last_name: 'Andrieux', address: 'Cascais', phone_number: '+33611121314',
  is_a_cook: :true, favorite_utensil: "barbecue", bio: "My name is Lucien, I'm a French student living in Cascais, Portugal. I love food. I especially love to cook for my friends.
  My specialties are frango assado, caldo verde and even pasteis de nata. As I'm in my last year of master, I do have some time to be a Home Chef for you!", price: 25)
cooker_2 = User.create(email: 'marion@marion.com', password: '123456', first_name: 'Marion', last_name: 'Gayon', address: 'Lisbon', phone_number: '+33615161718',
  is_a_cook: :true, favorite_utensil: "chopsticks", bio: "I really like to cook asian food. I find my inspirations through
  my travels and a lot of books. I do really like to browse chiefs' online cooking diary to find recipes to experiment.
    My Mum is Italian so I can also prepare Italian dishes as food is a tradition in our culture.", price: 30)
cooker_3 = User.create(email: 'andre@andre.com', password: '123456', first_name: 'André', last_name: 'Pires', address: 'Lisbon', phone_number: '+351910911912',
  is_a_cook: :true, favorite_utensil: "frying pan", bio: "Olá I'm André! I'm a full-stack developper, and when I'm not teaching code at le Wagon, I enjoy preparing delicious dishes for my friends.
  I would say that my best dish is homemade pizza!", price: 35)
booker_2 = User.create(email: 'emily@emily.com', password: '123456', first_name: 'Emily', last_name: 'Burns', address: 'Lisbon', phone_number: '+351913914915',
  is_a_cook: :false, bio: "Hey I'm Emily! I love risotto, especially with veggies since I tasted THE mushroom risotto
  in Italy while travelling with my boyfriend A couple years ago), I am looking for a cook that can do nice risottos! I also love seafood and soups!", price: 50)
cooker_4 = User.create(email: 'diogo@diogo.com', password: '123456', first_name: 'Diogo', last_name: 'Telo', address: 'Lisbon', phone_number: '+351916917918',
  is_a_cook: :true, favorite_utensil: "wooden spoon", bio: "I'm a software developper based in Lisbon and my specialty is pasta. I can make the most fabulous pasta and sauce, with or without meet.
  You can never go wrong with pasta! I also make nice salads and desserts.", price: 20)
cooker_5 = User.create(email: 'sharon@sharon.com', password: '123456', first_name: 'Sharon', last_name: 'Moriel', address: 'Lisbon', phone_number: '+351919920921',
  is_a_cook: :true, favorite_utensil: "electric mixer", bio: "Hello I'm Sharon and I'm from Israel. I've been cooking dishes from
  home my whole life as I learned with my mom and grandmother. When I'm not coding (I'm a full-stack developper),
  I like to experiment with food preparation. My friends always ask for my secret recipe: chocolate mousse!", price: 15)
cooker_6 = User.create(email: 'sara@sara.com', password: '123456', first_name: 'Sara', last_name: 'Andrieux', address: 'Marseille', phone_number: '+351410933345',
  is_a_cook: :true, favorite_utensil: "spatula", bio: "Hello I'm Sara and I'm from France. I use to cook for my childs and my close circle. I can cook pretty much everything but I have my own specialties:
  tarte tatin, arroz de marisco, azzor doce, quiches.", price: 30)
cooker_7 = User.create(email: 'kevin@kevin.com', password: '123456', first_name: 'Kevin', last_name: 'Bassa', address: 'Paris', phone_number: '+351414873345',
  is_a_cook: :true, favorite_utensil: "ladle", bio: "Hello I'm Kevin and I live in Paris city center. I love to go to the market and buy fresh vegetables like potatoes to do one of my favourite dish:
  raclette! I can also do traditional Italian margaritas or lasagnes.", price: 20)
cooker_8 = User.create(email: 'olivier@olivier.com', password: '123456', first_name: 'Olivier', last_name: 'Chazaly', address: 'Nice', phone_number: '+351414875945',
  is_a_cook: :true, favorite_utensil: "thoothpick", bio: "Hello I'm Olivier. I started cooking for myself during the Covid pandemia. Now all I want is to share my best recipes: tiramisu, roastbeef,
  fresh pastas, cakes, soupes, crepes and many more!", price: 20)
cooker_9 = User.create(email: 'clement@clement.com', password: '123456', first_name: 'Clement', last_name: 'Bourpif', address: 'Berlin', phone_number: '+351414199745',
  is_a_cook: :true, favorite_utensil: "spreading knife", bio: "Hello I'm Clement. I'm an expert of confitures and marmalades. If you want homemade fresh confiture for your mornings, I can prepare them
  for you, I'm sure you won't regret it!", price: 40)
cooker_9 = User.create(email: 'newton@newton.com', password: '123456', first_name: 'Isaac', last_name: 'Newton', address: 'Barcelona', phone_number: '+351417799745',
  is_a_cook: :true, favorite_utensil: "hands", bio: "Hello I'm Isaac. I'm from Algeria and I can cook traditional Maghrebian food for you. Couscous, bricks, brochettes, fresh salads, Algerian sweet cakes with almonds,
  candied fruit with honey. Book me, you won't regret it!", price: 35)
booker_3 = User.create(email: 'basile@basile.com', password: '123456', first_name: 'Basile', last_name: 'Bpikette', address: 'London', phone_number: '+351923414915',
  is_a_cook: :false, bio: "Hello I'm Basile, I'm a trader and I work 12 hours a day. I don't know how to cook: even making fried eggs is a challenge for me! I'm a bit overweight so I'm mostly here to look for
  healthy diet food.")


# booking_1 = Booking.create(number_of_meals: 3, user: user_1, cooker: user_3)
# chatroom_1 = Chatroom.create(name:'Booking 1', booking: booking_1)
# message_1 = Message.create(content: "Hey Marion! Looking forward to your nice dishes inspired by Asia!", user: user_1, chatroom: chatroom_1)
# message_2 = Message.create(content: "Hi Lola, yes I have a nice Pad Thai recipe for you. Don't forget to buy cilentro!", user: user_2, chatroom: chatroom_1)

# booking_2 = Booking.create(number_of_meals: 5, user: user_1, cooker: user_6)
# chatroom_2 = Chatroom.create(name:'Booking 2', booking: booking_2)
# message_3 = Message.create(content: "Hello Diogo, I love desserts, but you should know that I'm allergic to peanut!", user: user_1, chatroom: chatroom_1)
# message_4 = Message.create(content: "Hi there Lola, no problem, I won't use any peanut nor peanut butter in the desserts for you!", user: user_6, chatroom: chatroom_1)

