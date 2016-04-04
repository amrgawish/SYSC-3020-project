# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name:  "Alan",
             email: "alan@busycalendar.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true)

User.create!(name:  "Amr",
             email: "amr@busycalendar.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: false,
             activated: true)
