require 'date'
puts "starting to seed..."

User.destroy_all
Booking.destroy_all
Personality.destroy_all

user_1 = User.create({email: "izzyweber@gmail.com", password: "secret", first_name: "Izzy",
                  last_name: "Weber", location: "London", age: 29, gender: "female",
                  picture: "vqugs7t6aqnw7eej1ksp",
                  desired_age: 29, desired_gender: "male", bio: "Hi, I'm Izzy. I'm American and like to code - and I really need a date to my mom's
                  wedding in June!! You'd get a free trip to Boston and lodging for a week on the North Shore.", is_partner: false})

user_2 = User.create({email: "asdsda@gmail.com", password: "secret", first_name: "Ben",
                  last_name: "Pham", location: "Paris", age: 29, gender: "male",
                  picture: "vqugs7t6aqnw7eej1ksp",
                  desired_age: 29, desired_gender: "female", bio: "Hi, I'm Ben. I'm French and starting my own business so I need extra cash. I
                  particularly love going to weddings! Don't worry, my girlfriend is cool with this.", is_partner: true})

user_3 = User.create({email: "jonnygates@outlook.com", password: "secret", first_name: "Jonny",
                  last_name: "Gates", location: "London", age: 29, gender: "male",
                  picture: "vqugs7t6aqnw7eej1ksp",
                  desired_age: 22, desired_gender: "female", bio: "Hi, I'm Jonny! I drink a lot and I'm really friendly, so I'm a great person to bring
                  to work functions.", is_partner: false})

user_4 = User.create({email: "leticia@aol.com", password: "secret", first_name: "Leti",
                  last_name: "Ackaouy", location: "London", age: 22, gender: "female",
                  picture: "vqugs7t6aqnw7eej1ksp",
                  desired_age: 29, desired_gender: "male", bio: "Hi, I'm Leti! I'm super young and fun. I have steez. Just FYI, I'm vegan, so please don't
                  bring me to events where the only food is bacon-wrapped figs thx!!", is_partner: true})

ben_1 = Personality.new(first_name: "François", last_name: "Le Français", bio: "I'm the ultimate french guy: heavy smoker, snail eater and quite rude. On the positive side, I'm a very sophistaced eater and very passionate about arts.", desired_gender: "female", desired_age: 50, price_per_day: 35)
url = "https://i.redd.it/sifmpfgly0611.jpg"
ben_1.remote_picture_url = url
ben_1.user = user_2
ben_1.save

leti_1 = Personality.new(first_name: "Jessica", last_name: "Ravel", bio: "I'm the very discrete and quiet girl that people usually barely notice. I have a strong british accent, love the countryside and have never travelled outside of the UK", desired_gender: "male", desired_age: 24, price_per_day: 30)
url = "https://ki.se/sites/default/files/styles/adaptive/public/digis_jessica.jpg"
leti_1.remote_picture_url = url
leti_1.user = user_4
leti_1.save

leti_2 = Personality.new(first_name: "Violet", last_name: "Edgar", bio: "I'm quite the opposite of Jessica (my other me): I dress up quite wildly and am very expansive and loud. Very sociable, I can talk to anyone and I really enjoy the LGBT community.", desired_gender: "other", desired_age: 28, price_per_day: 45)
url = "https://www.out.com/sites/out.com/files/2018/01/24/ap_18008246236253.jpg"
leti_2.remote_picture_url = url
leti_2.user = user_4
leti_2.save

booking_1 = Booking.new({date: Date.new(2019,10,10), message: "Hi, French Ben! You seem cool and like I'm desperate so if you could come to my mom's wedding that would be great."})
booking_1.personality = ben_1
booking_1.user = user_1
booking_1.save

booking_2 = Booking.new({date: Date.new(2019,7,10), message: "Hi, Jessica! I'm trying to get into coding so need a fake girlfriend who can hang with the coders. A quiet girl like you sounds perfect! Looking forward to meeting xx."})
booking_2.personality = leti_1
booking_2.user = user_3
booking_2.save

puts "seeding done!"
