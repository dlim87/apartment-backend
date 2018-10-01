# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:"test@example.com",password:"123456",name:"user 1")
User.create(email:"test2@example.com",password:"654321",name:"user2")
Apartment.create(address_1:"1234 union cowork", city:"San Diego", post_code:12345, state:"CA", country:"USA", manager_name:"Me", manager_number:123456789, manager_time:"never",user_id:1)
Apartment.create(address_1:"898 Hilsdale Rd", city:"San Diego", post_code:98765, state:"CA", country:"USA", manager_name:"You", manager_number:987654321, manager_time:"always",user_id:2)
