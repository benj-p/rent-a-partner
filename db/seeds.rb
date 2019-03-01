require 'date'
require 'faker'

puts "starting to seed..."

Message.destroy_all
Review.destroy_all
User.destroy_all
Booking.destroy_all
Personality.destroy_all

user_1 = User.new({email: "izzyweber@gmail.com", password: "secret", first_name: "Izzy",
                  last_name: "Weber", location: "London", age: 29, gender: "female",
                  desired_age: 29, desired_gender: "male", bio: "Hi, I'm Izzy. I'm American and like to code - and I really need a date to my mom's
                  wedding in June!! You'd get a free trip to Boston and lodging for a week on the North Shore.", is_partner: false})
url = "https://avatars0.githubusercontent.com/u/40670298?s=460&v=4"
user_1.remote_picture_url = url
user_1.save

user_2 = User.new({email: "ben@gmail.com", password: "secret", first_name: "Ben",
                  last_name: "Pham", location: "Paris", age: 29, gender: "male",
                  desired_age: 29, desired_gender: "female", bio: "Hi, I'm Ben. I'm French and starting my own business so I need extra cash. I
                  particularly love going to weddings! Don't worry, my girlfriend is cool with this.", is_partner: true})
url = "https://avatars3.githubusercontent.com/u/43788107?s=460&v=4"
user_2.remote_picture_url = url
user_2.save

user_3 = User.new({email: "jonnygates@outlook.com", password: "secret", first_name: "Jonny",
                  last_name: "Gates", location: "London", age: 29, gender: "male",
                  desired_age: 22, desired_gender: "female", bio: "Hi, I'm Jonny! I drink a lot and I'm really friendly, so I'm a great person to bring
                  to work functions.", is_partner: false})
url = "https://avatars1.githubusercontent.com/u/40580116?s=460&v=4"
user_3.remote_picture_url = url
user_3.save

user_4 = User.new({email: "leticia@aol.com", password: "secret", first_name: "Leti",
                  last_name: "Ackaouy", location: "London", age: 22, gender: "female",
                  desired_age: 29, desired_gender: "male", bio: "Hi, I'm Leti! I'm super young and fun. I have steez. Just FYI, I'm vegan, so please don't
                  bring me to events where the only food is bacon-wrapped figs thx!!", is_partner: true})
url = "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/28166255_159709798170868_9092395890873744565_n.jpg?_nc_cat=110&_nc_ht=scontent-lhr3-1.xx&oh=1d9a1028c4fad3c06b9e660e761ddd01&oe=5D1D8B8F"
user_4.remote_picture_url = url
user_4.save

ben_1 = Personality.new(first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraph(5), desired_gender: "female", desired_age: (18..60).to_a.sample, price_per_day: (10..200).to_a.sample)
url = "https://s1.r29static.com//bin/entry/c20/x,80/1884199/image.jpg"
ben_1.remote_picture_url = url
ben_1.user = user_2
ben_1.save

ben_2 = Personality.new(first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraph(5), desired_gender: "female", desired_age: (18..60).to_a.sample, price_per_day: (10..200).to_a.sample)
url = "https://usercontent2.hubstatic.com/13198383_f520.jpg"
ben_2.remote_picture_url = url
ben_2.user = user_2
ben_2.save

ben_3 = Personality.new(first_name: Faker::Name.male_first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraph(5), desired_gender: "female", desired_age: (18..60).to_a.sample, price_per_day: (10..200).to_a.sample)
url = "https://m.media-amazon.com/images/M/MV5BMTQ1N2QxMTEtMDI1Ny00MGYzLWFhYzgtMGU0Mzc4MTI4ZjA5XkEyXkFqcGdeQXVyNTc3MjUzNTI@._V1_.jpg"
ben_3.remote_picture_url = url
ben_3.user = user_2
ben_3.save

leti_1 = Personality.new(first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraph(5), desired_gender: "male", desired_age: (18..60).to_a.sample, price_per_day: (10..200).to_a.sample)
url = "http://www.contactmusic.com/pics/ln/20170523/230517_cff_70th_anniversary_gala/70th-annual-cannes-film-festival_5699156.jpg"
leti_1.remote_picture_url = url
leti_1.user = user_4
leti_1.save

leti_2 = Personality.new(first_name: Faker::Name.female_first_name, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraph(5), desired_gender: "male", desired_age: (18..60).to_a.sample, price_per_day: (10..200).to_a.sample)
url = "https://ucesy-sk.happyhair.sk/celebrity_img/Laetitia_800-2015-06-11-181209.jpg"
leti_2.remote_picture_url = url
leti_2.user = user_4
leti_2.save

booking_1 = Booking.new({date: Date.new(2019,7,22), message: "Hi, I can't wait to meet you! Your profile looks really good. I hope you'll enjoy this, it should be fun."})
booking_1.personality = ben_1
booking_1.user = user_1
booking_1.save

booking_2 = Booking.new({date: Date.new(2018,11,21), message: "Hi, I can't wait to meet you! Your profile looks really good. I hope you'll enjoy this, it should be fun."})
booking_2.personality = ben_2
booking_2.user = user_1
booking_2.save

booking_3 = Booking.new({date: Date.new(2019,1,15), message: "Hi, I can't wait to meet you! Your profile looks really good. I hope you'll enjoy this, it should be fun."})
booking_3.personality = ben_2
booking_3.user = user_1
booking_3.save

booking_4 = Booking.new({date: Date.new(2018,8,5), message: "Hi, I can't wait to meet you! Your profile looks really good. I hope you'll enjoy this, it should be fun."})
booking_4.personality = leti_1
booking_4.user = user_3
booking_4.save

booking_5 = Booking.new({date: Date.new(2018,5,17), message: "Hi, I can't wait to meet you! Your profile looks really good. I hope you'll enjoy this, it should be fun."})
booking_5.personality = leti_1
booking_5.user = user_3
booking_5.save

review_2 = Review.new(personality_rating: (1..5).to_a.sample, personality_comment: Faker::Lorem.paragraph(2), user_rating: (1..5).to_a.sample, user_comment: Faker::Lorem.paragraph(2))
review_2.user = user_1
review_2.personality = ben_2
review_2.booking = booking_2
review_2.save

review_4 = Review.new(personality_rating: (1..5).to_a.sample, personality_comment: Faker::Lorem.paragraph(2), user_rating: (1..5).to_a.sample, user_comment: Faker::Lorem.paragraph(2))
review_4.user = user_3
review_4.personality = leti_1
review_4.booking = booking_4
review_4.save

review_5 = Review.new(personality_rating: (1..5).to_a.sample, personality_comment: Faker::Lorem.paragraph(2), user_rating: (1..5).to_a.sample, user_comment: Faker::Lorem.paragraph(2))
review_5.user = user_3
review_5.personality = leti_1
review_5.booking = booking_5
review_5.save

bookings = Booking.all

bookings.each do |booking|
  Message.create(recipient: booking.personality.user, sender: booking.user, booking: booking, content: "Hey, #{booking.personality.user.first_name}!", read: true)
  Message.create(recipient: booking.user, sender: booking.personality.user, booking: booking, content: "Thanks for the message!")
end

10.times do
  booking = Booking.first
  Message.create(recipient: user_3, sender: booking.personality.user, booking: booking, content: "Thanks for the message!")
end


puts "seeding done!"
