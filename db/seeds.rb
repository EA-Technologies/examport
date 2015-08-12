# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create( email: 'admin@admin.com', password: 'welcome123', password_confirmation: 'welcome123' )
User.create( email: 'user1@ea.com', password: 'password', password_confirmation: 'password' )
User.create( email: 'user2@ea.com', password: 'password', password_confirmation: 'password' )
User.create( email: 'user3@ea.com', password: 'password', password_confirmation: 'password' )
User.create( email: 'user4@ea.com', password: 'password', password_confirmation: 'password' )
User.create( email: 'user5@ea.com', password: 'password', password_confirmation: 'password' )
User.create( email: 'user6@ea.com', password: 'password', password_confirmation: 'password' )


Setting.create(name: "passing_marks", value: "40")
Setting.create(name: "mark_per_question", value: "10")