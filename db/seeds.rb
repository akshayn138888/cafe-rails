# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

User.delete_all
Feature.delete_all
Course.delete_all
Categori.delete_all
DailyMenu.delete_all


User.create(
    {
        name: 'akshay',
        email: 'johnsnow@gov.com',
        password: "111222",
        admin: true
    }
)
user = User.first

Categori.create({
      name: "Mains"
})
Categori.create({
      name: "Starters"
})
Categori.create({
      name: "Desserts"
})
Categori.create({
      name: "Drinks"
})

menu = DailyMenu.create(date: Date.today, user: user )

categori = Categori.all

NUM_COURSES = 20

NUM_COURSES.times do 
    Course.create({
    name: Faker::Food.dish,
    categori: categori.sample
  })
end

courses = Course.all

NUM_FEATURE = 5

NUM_FEATURE.times do
  course = courses.sample
  Feature.create({
    daily_menu: menu,
    course: course,
    price: rand(10..50.0),
    portion: [true, false].sample
  })
end








