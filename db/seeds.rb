# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


99.times do |n|
  name  = n + 3
  email = "#{n + 3}"
  password = "123456"
  User.create!(name:  name,
               email: email,
               supervisor: false,
               password:              password,
               password_confirmation: password)
end