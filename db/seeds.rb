# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Band.delete_all
Video.delete_all

u1 = User.create(name: 'User1', email: 'user1@testmail.com', password: '1234567', password_confirmation: '1234567')
u2 = User.create(name: 'User2', email: 'user2@testmail.com', password: '1234567', password_confirmation: '1234567')
u3 = User.create(name: 'User3', email: 'user3@testmail.com', password: '1234567', password_confirmation: '1234567')
u4 = User.create(name: 'User4', email: 'user4@testmail.com', password: '1234567', password_confirmation: '1234567')

b1 = Band.create(name: 'Band1', email: 'band1@testmail.com', password: '1234567', password_confirmation: '1234567')
b2 = Band.create(name: 'Band2', email: 'band2@testmail.com', password: '1234567', password_confirmation: '1234567')
b3 = Band.create(name: 'Band3', email: 'band3@testmail.com', password: '1234567', password_confirmation: '1234567')
b4 = Band.create(name: 'Band4', email: 'band4@testmail.com', password: '1234567', password_confirmation: '1234567')

v1 = Video.create(title: 'Video1', youtube_url: 'https://www.youtube.com/watch?v=sQWlQUv5ej4', band: b1)
v2 = Video.create(title: 'Video2', youtube_url: 'https://www.youtube.com/watch?v=0FMfsT11pdA', band: b2)
v3 = Video.create(title: 'Video3', youtube_url: 'https://www.youtube.com/watch?v=9Q7Vr3yQYWQ', band: b3)
v4 = Video.create(title: 'Video4', youtube_url: 'https://www.youtube.com/watch?v=fN1Gw8PHkAI', band: b4)

v1.add_evaluation(:votes, 1, u1)
v1.add_evaluation(:votes, 1, u2)
v2.add_evaluation(:votes, -1, u4)
v2.add_evaluation(:votes, 1, u2)
v3.add_evaluation(:votes, -1, u3)
v3.add_evaluation(:votes, 1, u4)
v3.add_evaluation(:votes, 1, u2)
v4.add_evaluation(:votes, 1, u1)
v4.add_evaluation(:votes, -1, u3)


